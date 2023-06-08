Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671857279DB
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 10:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcHJM1FtYz3dx8
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 18:22:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Dqfu2EZk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::727; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Dqfu2EZk;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20727.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcHJB44X8z3brd
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 18:22:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM0EUWT0DKJfZWAEgvFQL4cJaevh0ZgpAcKBq4gDo7mAD7E0tLNpviSQx94ahHjYFsdi+rTLqrMuzRU5gOtdHR024V8WbrxAWuhiUILEJ595oskROwhgNDH59sLnRGDdDtIRcVYXPChv8VWo+Exxj+0YYmxiKyKZhydASl05AUniD3r+Scr4XlPqVzciFeM0JV169dnltE5vFft+UokAhGa3cfgt6qAxPl3crQ9wCCyYCy2/L6wJe3phFXO6rJBCzPmJa67e88XHVrHEqWEYe6XI/8ijAbXXz+PBLZAB2TGiE4i/51c+kSuO9inm2S5Y8eewRpi3Uuja1XKIKBcu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4+mRPsoZhAI1VQcbJFWH/LNBUqo22H9Gr3TdITDgYY=;
 b=JMH3+okvpADt9f+aKcMIa//F5C1WtP+VfjCRUwey7wufcwba/NuB4gpGu7QoD6a1+IMWgCD+XXvuSce82+EET4AwJ4bNZqxWo/JVoUAK/7jMOXlytKvb6tri38fihs0R+N2FsSdeXtt2tJfr+1EW1PtqvuJ8WCv7iOBewnVF8BUh19AbPUkpJEDSKPFtgOV3N8JUx8Vj3uhkGUWv33qG7X4l90KgXO6ox6g+hwIz15XWd8nMpI36TVPFNaO3+xm7gPo0FTWbf8ntFellToe1ar1cr5FUIftE6ziM09JYE15197Va9PkKRUUPAr0MrNlltjlC5r85sm02w56oTKuI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4+mRPsoZhAI1VQcbJFWH/LNBUqo22H9Gr3TdITDgYY=;
 b=Dqfu2EZkNnC+d3j6Ctza/A/0FUVdfxRf1jTec8y9RnhJk/g43H/h3YnhCL0Na4xgYRUdO6byNUDPQbR1obqcy0eIxPQf4/DD9kbRQCs07u/xtQ/8UAUMMflCoP+9opj8c2Wud/Zp45rSUJ26Cf3xGpdozApsrAYfuSHzmyh6NeMCwek5Qzuir0BTwRBNYMuXxJIcNlcaRGObR/v8FZtNYV7CfIYnRxBmnjWQQduKhTrzQZKXIPxF3+txZ4uz+PDbmwb4VvxAtfx48BiQHRVMn1KqTH7xxc6brDgighrNmIHuz8UalkinaojlwQmCuaZaei3fV/4AR193ie5y+9rSyw==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SEYPR06MB5465.apcprd06.prod.outlook.com (2603:1096:101:b8::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.38; Thu, 8 Jun 2023 08:21:52 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 08:21:52 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"corbet@lwn.net" <corbet@lwn.net>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Thread-Topic: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Thread-Index: AQHZma8+6LJZhu/Vfk6W8iuVf8iT56+AdouAgAAQppOAAAI2gIAAA3Jl
Date: Thu, 8 Jun 2023 08:21:52 +0000
Message-ID:  <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
 <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
 <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
In-Reply-To: <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|SEYPR06MB5465:EE_
x-ms-office365-filtering-correlation-id: a07a9586-808d-4791-aa05-08db67f969ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Tdbvi+565m2B298v5Y2x4k7j9p1p9JTQPXoXY8Gr4FUxQ3pH3eJv47oihSAEep4o/yn0Luzd/foIiFj99Vutq2PVNeP43PKPGt8kccZYdYeEscn0E9ntT+8qyq+o3ZF4z56znNB4G8iwmClz8ZmAJ8hcfRDVlb4crYvHCPJTgNl9ybOAdOL5FmzXTbsbs8Xm3MK3fzN3V0+k9vsc3rB4rk+LvtI7fHejvRfAiypjpbXcZVUvq+OkeQ3T4Xi+48Nq8Yv5WXbBwMAKtKmFky4FxHOKVFVJvXdZoJNcpdiwHjRUQ2ZpPIS5sYfoqQELEeBbo0Bff7tEZGq0o1N3LV0NvaBu/QCPK/2CZuC8ZRVtHFoElK7AIW/YYRzKmLmxngIzMD1JG5dL/lC70R6j4ZPSmbGModcxAB/WkX2EkFLyl/9H18sf6oyGggcNl6slYJ2bsQZsc8IgG37dO947L6Isj6hiiKqrUwajI+2feXxJyUkunZeY1UN4MY3SnrvPoQf6+cmT3y1oesS5nJhFQZ1PhWAh7S+4cPcdDruMDqYz5Ua1bXeEYhZe8ardVw4QjUD3rwBEOtG472Ff/qjnzBbb3W0Bc8SqomvBsZU6b6AJFcFufIqPM5tWj2u8XrxLjMV4+wjGBPQn71ZR6hWTgWsSGw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199021)(66946007)(91956017)(76116006)(8676002)(8936002)(52536014)(5660300002)(66476007)(66446008)(66556008)(64756008)(71200400001)(110136005)(478600001)(316002)(41300700001)(7696005)(38100700002)(55016003)(122000001)(921005)(53546011)(55236004)(9686003)(186003)(38070700005)(26005)(83380400001)(6506007)(7416002)(86362001)(2906002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?P7TEePjcr7TOFHNY0AF0C3vqZcg2DQnQXQKI8ZN6n+Su29starPOWOw71ylz?=
 =?us-ascii?Q?FU36aCebbxz/PifviaI/63K82v9vXj2RS6V/ZoewMHNWNLry1+uJV4bM/SWC?=
 =?us-ascii?Q?tp8y97vlGzO+daPXcErcD+/j4Rh8ovuNBrkuavZHfrb1icbx9LUGWSgsYf2R?=
 =?us-ascii?Q?mrCZRJ0dM8s8jxPEycIViNikneK6A+h3HuuDOts1b3nLkWgeZN8iuPDrMxWY?=
 =?us-ascii?Q?foj/sK8X13rdfKIJXWJHsXUU/bSA5NNgotLBwjGzeEsAGPpKJ1XZUS/oV9Yu?=
 =?us-ascii?Q?Hk4BzrmhCpgw2Pn5vEn1dLsFvsatoN/zkXUkjV7icUoko1ovpPkvbHQa50PA?=
 =?us-ascii?Q?sfmeoeR4om/+df7SAzWVRG5ZP2Tp67WC+DqALmBO4/yOCHrcAMCoKfoy3+g3?=
 =?us-ascii?Q?DIkgw1Q3Je2dk8l97y0674BLLbvZyfcoOIWEbtJ1rBG9UirCw7cCBKoLHdk0?=
 =?us-ascii?Q?7+afnh79MwM0Kwe6FFV1slb3NsGiccM/Mw3kqpwSkuGoATLC2dc65Up6UmRa?=
 =?us-ascii?Q?j4fmb+ckxu9icyR8ee5XouHEiuN74MEhBWLIGU+waTfuLnDJVszyY+6K+3LI?=
 =?us-ascii?Q?OIv+OEYILu4CWjKi3+Qc1ByTu/xINbrldzLw6HFtXebmJJ60AeM3KGnBGe/q?=
 =?us-ascii?Q?2aBYjx27LzcGdEHrMwrVBSltaHhNZY3TmTeDikm8uViMDh5Nv7cSWf88siyg?=
 =?us-ascii?Q?HsWU+ypcIB479947E6qY3shFqNcv9f+SOrcQvumMCy+EcFX/Kz3sO4I39bfs?=
 =?us-ascii?Q?/vBNiJejCiu2SCHW1IfAAo/Cs7eZrs2bnsOUZXzzB/pArTcfTh/Pkeu7w68I?=
 =?us-ascii?Q?Am1ifIhkY/Q20Qg7SHLchxq08OxKHlT6TBuXOdcN6NCtKsRJBichWAnGFnQd?=
 =?us-ascii?Q?T9cbaxK1FmuZbOmCzzqOwMD6XLlP6yPMoslYCba2uUCIv/WBIc/zBGs/gF7Z?=
 =?us-ascii?Q?x5kdXKPcB5/O8mEbIZSNBYqWwNJUG6q6V4B18FZTuRv45bvmwS9QWkZ49JYZ?=
 =?us-ascii?Q?4QMu90x+Lak73tYMwKqTqaJgBGTV4pjzGldex/GuCugqiRx1k3bkgGHgIcZx?=
 =?us-ascii?Q?ubZBh4/H3zwMQznZ0plW17/zsV4Yu3o7nSl39j91GKvNF1LfeynloYL2uYwk?=
 =?us-ascii?Q?WOAp6jEli8W0dBbaU67+yOv9NWwb7vKN1Sx3udFHsuRI4v4+ZhDQ2Szlkcij?=
 =?us-ascii?Q?xLUwBVrSZ6dbXsVz5Y3XsBSgp639AhrPwGjiFoANnwrXbnDl/GO9Wi6um6uh?=
 =?us-ascii?Q?gTTkHWJa+XkYa0mPetGq036tDcAORx4njdgRMyNvIl4YTR6jnaB8IMA7ogGG?=
 =?us-ascii?Q?/aQmmJuR8AgS7VLuCczz9uKhEvVZ8zNs2jL4D6a8Et8gvb5aAyr8VxSnBc6B?=
 =?us-ascii?Q?hDkJw2NOeEckWt4MvPm50n9lXTGh0B7WUgbCYVWIPgW7K672wE1jk43YcvZX?=
 =?us-ascii?Q?R87xQcfnIQoijsxjKVs7KICkVSf88+3eTmubRVxwvVBUkF09hi6yUyjKHFvH?=
 =?us-ascii?Q?RCj30m7GBfmbvpOrktpOHuf05ghzYCF6e5gUskatHUKtyMX9aBhcuf1in+ge?=
 =?us-ascii?Q?oZRuyiA/PK7TlEOV6QbM0ZQsr0WkDl3++bGGbJNHuLcBCezbTlIv9YOyt81V?=
 =?us-ascii?Q?TDeg6itZTw/mk0AkGYkUNbA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB336528007D2685F8D95DF4078B50ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07a9586-808d-4791-aa05-08db67f969ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 08:21:52.2395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1rfGFsrRw2EF0qvKM7r6+U0AF2WlZ7xFVcbRwDZaw5iiJrqKqhDyv0nQvrTP9T7zLZzKRCNyp5S/y0vmpk9rR6RFjuIOe6xljE6cXWoRJQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5465
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_SG2PR06MB336528007D2685F8D95DF4078B50ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

        On 08/06/2023 09:47, Billy Tsai wrote:
        >>
        >>   >> +
        >>   >> +allOf:
        >>   >> +  - $ref: pwm.yaml#
        >>   >> +
        >>   >> +properties:
        >>   >> +  compatible:
        >>   >> +    enum:
        >>   >> +      - aspeed,ast2600-pwm
        >>   >> +
        >>   >> +  "#pwm-cells":
        >>   >> +    const: 3
        >>
        >>   > 3 cells? For one PWM? What are they?
        >>
        >> channel, period and polarity.

        > Don't cut my responses. You wrote you have one PWM output, so onl=
y one
        > channel. What do you put then in the channel?

You need to put 0 in the cell of the channel, the example of the dts usage =
will like following:

pwm0: pwm0@1e610000 {
        compatible =3D "aspeed,ast2600-pwm";
        reg =3D <0x1e610000 0x8>;
        #pwm-cells =3D <3>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_pwm0_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "okay";
};

pwm1: pwm1@1e610010 {
        compatible =3D "aspeed,ast2600-pwm";
        reg =3D <0x1e610010 0x8>;
        #pwm-cells =3D <3>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_pwm1_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "okay";
};

fan0: pwm-fan0 {
        compatible =3D "pwm-fan";
        pwms =3D <&pwm0 0 40000 0>;            /* Target freq:25 kHz */
        cooling-min-state =3D <0>;
        cooling-max-state =3D <3>;
        #cooling-cells =3D <2>;
        cooling-levels =3D <0 15 128 255>;
};

fan1: pwm-fan1 {
        compatible =3D "pwm-fan";
        pwms =3D <&pwm1 0 40000 0>;            /* Target freq:25 kHz */
        cooling-min-state =3D <0>;
        cooling-max-state =3D <3>;
        #cooling-cells =3D <2>;
        cooling-levels =3D <0 15 128 255>;
};

        > I will start NAKing such patches without DTS user. It's like revi=
ewing
        > fake code for some unknown solution and trying to get from you pi=
ece of
        > answers one by one, because you do not want to share entire part.


--_000_SG2PR06MB336528007D2685F8D95DF4078B50ASG2PR06MB3365apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; On 08/06/2023 09:47, Billy Tsai wrote:<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +allOf:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; - $ref: pwm.y=
aml#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +properties:<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; compatible:<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp; e=
num:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; - aspeed,ast2600-pwm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; &quot;#pwm-ce=
lls&quot;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp; c=
onst: 3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp; &gt; 3 cells? For one PWM=
? What are they?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; channel, period and polarity.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; Don't cut my responses. You wrote you have one=
 PWM output, so only one<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; channel. What do you put then in the channel?<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">You need to put 0 i=
n the cell of the channel, the example of the dts usage will like following=
:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">pwm0: pwm0@1e610000=
 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-pwm&quot;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610000 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #pwm-cells =3D &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_pwm0_default&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">pwm1: pwm1@1e610010=
 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-pwm&quot;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610010 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #pwm-cells =3D &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_pwm1_default&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">fan0: pwm-fan0 {<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;pwm-fan&quot;;<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pwms =3D &lt;&amp;pwm0 0 40000 0&gt;;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Target freq:25 kHz =
*/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; cooling-min-state =3D &lt;0&gt;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; cooling-max-state =3D &lt;3&gt;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #cooling-cells =3D &lt;2&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; cooling-levels =3D &lt;0 15 128 255&gt;;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">fan1: pwm-fan1 {<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;pwm-fan&quot;;<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pwms =3D &lt;&amp;pwm1 0 40000 0&gt;;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Target freq:25 kHz =
*/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; cooling-min-state =3D &lt;0&gt;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;cooling-max-state =3D &lt;3&gt;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #cooling-cells =3D &lt;2&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; cooling-levels =3D &lt;0 15 128 255&gt;;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; I will start NAKing such patches without DTS u=
ser. It's like reviewing<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; fake code for some unknown solution and trying=
 to get from you piece of<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; answers one by one, because you do not want to=
 share entire part.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; </span></p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB336528007D2685F8D95DF4078B50ASG2PR06MB3365apcp_--
