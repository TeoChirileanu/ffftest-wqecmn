import '../backend/commerce/payment_manager.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FakeCheckoutWidget extends StatefulWidget {
  FakeCheckoutWidget({Key key}) : super(key: key);

  @override
  _FakeCheckoutWidgetState createState() => _FakeCheckoutWidgetState();
}

class _FakeCheckoutWidgetState extends State<FakeCheckoutWidget> {
  String dropDownValue;
  String transactionId;
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF262D34),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            print('IconButton pressed ...');
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF95A1AC),
            size: 30,
          ),
          iconSize: 30,
        ),
        title: Text(
          'Back to Products',
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF8B97A2),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF262D34),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          color: Color(0x3E000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://d010204.bibloo.cz/_galerie/varianty/96/969946-z.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Multi-Color Jacket',
                    style: FlutterFlowTheme.bodyText2.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF8B97A2),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '\$125.00',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF39D2C0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: FlutterFlowCreditCardForm(
                formKey: creditCardFormKey,
                creditCardModel: creditCardInfo,
                obscureNumber: true,
                obscureCvv: false,
                spacing: 10,
                textStyle: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                inputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9E9E9E),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9E9E9E),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowDropDown(
                    options: ['Quanity', '1', '2', '3', '4'].toList(),
                    onChanged: (value) {
                      setState(() => dropDownValue = value);
                    },
                    width: 120,
                    height: 50,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF95A1AC),
                      size: 15,
                    ),
                    fillColor: Color(0xFF090F13),
                    elevation: 3,
                    borderColor: Colors.transparent,
                    borderWidth: 0,
                    borderRadius: 8,
                    margin: EdgeInsets.fromLTRB(20, 4, 8, 4),
                    hidesUnderline: true,
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      final transacAmount = 1.0;
                      if (!(creditCardFormKey.currentState?.validate() ??
                          false)) {
                        return;
                      }
                      if (kIsWeb) {
                        showSnackbar(
                            context, 'Payments not yet supported on web.');
                        return;
                      }

                      final cardRequest = BraintreeCreditCardRequest(
                        cardNumber: creditCardInfo.cardNumber,
                        expirationMonth:
                            creditCardInfo.expiryDate.split('/').first,
                        expirationYear:
                            creditCardInfo.expiryDate.split('/').last,
                        cvv: creditCardInfo.cvvCode,
                      );
                      final cardResult = await Braintree.tokenizeCreditCard(
                        braintreeClientToken(),
                        cardRequest,
                      );
                      if (cardResult?.nonce == null) {
                        return;
                      }
                      showSnackbar(
                        context,
                        'Processing payment...',
                        duration: 10,
                        loading: true,
                      );
                      final paymentResponse = await processBraintreePayment(
                        transacAmount,
                        cardResult.nonce,
                      );
                      if (paymentResponse.errorMessage != null) {
                        showSnackbar(
                            context, 'Error: ${paymentResponse.errorMessage}');
                        return;
                      }
                      showSnackbar(context, 'Success!');
                      transactionId = paymentResponse.transactionId;

                      setState(() {});
                    },
                    text: 'Buy Now',
                    options: FFButtonOptions(
                      width: 170,
                      height: 50,
                      color: Color(0xFF39D2C0),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
