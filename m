Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971C727734
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 08:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcDdS4vZJz3dxY
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 16:22:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FT9W8Ned;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::714; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FT9W8Ned;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20714.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcDdF1WF4z3cNY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 16:21:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enEBHr/p27sfR0R6NyK5i7GEdGPP1hP/CiUvgGEbRRKIWKVDseJOEUYZRzP7EAAnO/9A5bJfqSbufI5CragDGKYpWftGoTFxhGZAxhl5hofhA3UV+8S2qJUeCf5OVizoaMKKsmbvoRAFn1QUoH47WIyckf8LOoA4MXIXNJN9Mf9HT+bKBMV+jzdl5fqUS7PrCXvGGyeiLpDoKQh97PIh6Pm0r7wYJcPs+3+eQQF0oeFaG9/vnI23YaAmvqL6PuhYOAy8ntFSyIYXtvEIoTkVciHIbZiQbHzhU8HxGn3ELc2+7E8ccE+vcmEDGeyh3kIkghY+qH4em/XQOMaasY9HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuufjG1Jz+QKxoqfLaRSeN+1n/tJaePN9osDjsNPR8I=;
 b=KsZ5C/MqdOrtJyeIZF7fwf+KgUjwftDE3I4TgP4X7gY2NnT5DqSfx5+L9m1qs65J15N4aZfdj4cTlHLjiFyk4LIdS6FzflameTOBVWtMlkjg6pPNu6ZcF8sLrl7FXmE31ybcl0S+MHIBBf9SqKkFehVRtRJy6CicBV6PpQTfqyusEF8lMNckEqBMbK0SuVR7Ltmilcj/sFEQIKZt2qdovaPNi0LGbTKAOC4vcjXLIuSrp/PCfOmYcBmRnXzmItjur3yweNOlxp07dB1s/VIAfmAjQaMcqr/qypnYOCQ7lI6RASh7cxtnd2aeujyubhzUX2DIe/5WtgA3B06MxwkAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuufjG1Jz+QKxoqfLaRSeN+1n/tJaePN9osDjsNPR8I=;
 b=FT9W8NedBYZF7uVNXnryYg4r3h3qeXy6VeksAqGJ77VkQGBk/v7QykMYI/a6Hhwa051xpa9UVmM62PMaSHLhMkvGUN6cm5pma7hhUJLrmNbF1bG/mkXCo4VRVC9YkJqWh9rrhNjhiZEBe/6SZ/EQQkP5qOQQqqsA+fr7SKThjV3RuqRVgzHcpIYxFtvLtGnyckZm9tMqS1IzxAJkgelPj6C7VjBYPS4RQ3z5lLFnpmIZmpDK2tS6jqboLPYRLkisDtRFlgRfEXaKil3N5jwM816go41bGS2OKX98ac40v+ZesyrzEMnbxaGM7xgBZjaIcVsgr44MaARQhe/F9ttDgw==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SI2PR06MB4609.apcprd06.prod.outlook.com (2603:1096:4:142::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19; Thu, 8 Jun 2023 06:21:24 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:21:24 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Thread-Topic: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Thread-Index: AQHZma89aOEdGxKS0EScrdWknPpRuq+AWFqAgAAVuQk=
Date: Thu, 8 Jun 2023 06:21:23 +0000
Message-ID:  <SG2PR06MB3365E360F3FCDE639F3D2D1E8B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-3-billy_tsai@aspeedtech.com>
 <c1c485b0-b68b-4db7-4b67-5d59f1ecb84e@roeck-us.net>
In-Reply-To: <c1c485b0-b68b-4db7-4b67-5d59f1ecb84e@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|SI2PR06MB4609:EE_
x-ms-office365-filtering-correlation-id: 6694b4c5-b5b2-43e0-431d-08db67e89589
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Z35JNeheEdBB4S9zFRUqyZ0xrx3481dJwiSy254RG3GrH2Z3m5qaalRd+MUDOTyd84pGyuEXa80e3c0jDy5w7ytmmGl/orrNyBf9nDFyZbBZFHeNNzfeaMxyN7Z6dVfJ1wWau4fT2xSmv6sgvtXJl4tkrmeGYafFEdMyBFV93OjMlUopwLQAOPM5kGmjM/Fo6Z/ix+FMQX91vqWiyV1Re2lmMQFc1e23S4AsQE0XAW1HaP2lS3ax89ln31TGv0WaBcaMKZhrmtwxqrY0kuqgymX4weWOXCvI8tQ67mGO/XqLOzZ37qQp/lLrtqaQjG9F3zyFjocBosK/GMOXYgQE+kzMjfaFnt1tzsYANvdBAi4E+UkhNSIhO6Fx3C8+xd5cEcyQOA3T+NvHEAHMcTADr4gJCUsGuRIniBnEGa3CgVFNh/oCGb8v1XswnIVmuR/CwrQ59xVZ+2JkbTPGruubETdWZDNwq2kn7mh2BpJD9nzalGN2J9PU9/hKEoHsHjRP7ivU12WHWU1F6CqZW6s+/kpUoTqwiBzOa8sZttBIPIx880f/J9i7QwI9Q4L457zAB7xEwXBiixnMxrB+WRnW3ZOrX9QA9w/adPShH7leEY8V+GaN6UkMNnQABJJAt1Uv
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39850400004)(396003)(376002)(136003)(451199021)(186003)(83380400001)(478600001)(71200400001)(38070700005)(6506007)(55236004)(9686003)(26005)(55016003)(8936002)(86362001)(66556008)(91956017)(316002)(122000001)(66476007)(64756008)(76116006)(921005)(7696005)(66446008)(66946007)(5660300002)(2906002)(52536014)(41300700001)(8676002)(38100700002)(33656002)(7416002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?tkw4GuJws2ZfUQD+Ox/vt9gT8X30xjJv8J6N74Wl/YNc9FFDqIWVMEDUnlpd?=
 =?us-ascii?Q?wQXgxCKifw1vng0YEufLofQitN1PgdPYG6ReBODWl3+PGnNITQbCdnqeWFxV?=
 =?us-ascii?Q?0rzRVQJGNN6YZzHw3GO0j8Gd4xpC4SqvgJdDAkiQVYQ5kITcpYkEYzl5zFtQ?=
 =?us-ascii?Q?Mvv4q1MdGpn5LjByWuNicxJUq0HGf1WdfqqGp9L1mi1FNlRJmZPrk6xj6CKn?=
 =?us-ascii?Q?Yg2pnqRgd5BJMVXzqO1ep2hSWuIZ4RpTmevCBuwuoao+qGrU3vDOqSOdEK02?=
 =?us-ascii?Q?Zk7i1NpG4Qt+TBHS6cIXKIQQjfqd3PypSzb6NGYV7zpXBeXce5dtUGzm2+Ju?=
 =?us-ascii?Q?elgvyv1uF9E8xe4IolIkn2eVtCcbar7g7hP9zHSKGJzjtzlRI03HYhgHwuEX?=
 =?us-ascii?Q?zuaQW5SLkuk5IuxfR0U2225HJ+tOmZTYiu1KX9bx8OcyE46zMxqGChHqtS7L?=
 =?us-ascii?Q?29s36rD+ESW35FQpxgqlkFEMrAZkJ8CjiktRwwLcVgRBFXwd6I/8qJTUKS2M?=
 =?us-ascii?Q?AlnLMLYvBUFAroSs5yDsB7IeFMvNzBs1/SG2KdVUS9noM5mYEJYXTc/4EGvD?=
 =?us-ascii?Q?PvTc+/eKFIuZofLaeP52lGVg0x8WghYQiEfylmPqlvEq5j3mTxI7+SizuHKU?=
 =?us-ascii?Q?mo2ulNbne/jAfcK2dzsycec66ftzsE8TvjYTQIkdJd/Gvq9FXq4R5duIel13?=
 =?us-ascii?Q?0jpr6GyMIqkE22ihICJJqeJUNsKNtWE60zg1wkZ9ChvPmhH47hdBGpB3tOZu?=
 =?us-ascii?Q?3nKE+EoLWyFKaOsMmDjViGvTSZlkytifvsuSroXavdvMndNvkmbDcEkmwcn4?=
 =?us-ascii?Q?xSwmoXAJ2IAA0faX64zJHHvOQFjtAlAwLT5jRklEjzqT43rKTroA+4MHWvFj?=
 =?us-ascii?Q?IR/NH9EzX+mxF+7t63r7TVO/NLw3VuItgbsVPNL5jdG52lHffd05gu8E7RNv?=
 =?us-ascii?Q?MJ0K05QMxBw1e3if+n/IQYS8s7+EizgYo9E+kCAd2lf+Y+dwzC1DEbuLrUj9?=
 =?us-ascii?Q?h96BGSjwF/G0cohnV0LnuAicosBCygMGHyDlZYotNhEdWGQ6JGdAlMVVqVnh?=
 =?us-ascii?Q?Xd8QSddTsYEJbQSQLeegjM3prxSki8dj9vyk7rv0EMZUJxZNkYu8BvYdM4ID?=
 =?us-ascii?Q?mCrAmXzGaOLUHQ2rbKj5dMm8oZB+BtpLCdTuJHou3j89rmAg6VAi+a3rFwHU?=
 =?us-ascii?Q?ALeVRMLOygykQ6LK6+JL1UnfPS6EL2fpDekOCR3GuaJVJzbSDhJvDjkgod9d?=
 =?us-ascii?Q?K/Tqbel9PZWp6h1apbYgwTvT4EN56CdPhzy6cko9GyUfFGvgqZ+e5wriA4qa?=
 =?us-ascii?Q?4r1H1KNoTcHykheHDJoarMMStoMWRsHqRbE8Gx/SMj5TumqBx1bpep6z2HZZ?=
 =?us-ascii?Q?g5iwVS+fFOpHgP89kB3h4q1FJJndT6gma43J1l09CHmyfHRMGr94NTzNPK+P?=
 =?us-ascii?Q?9vmHxMgvT+H619IOng2dkZ36bE0NCzZl9ErXEBZZvcoH7yrqnTPkpcKWInra?=
 =?us-ascii?Q?ga2Up0VBNYjwET7EmdTqn1ifCw+qkqbW7a1KBCeCuxYo/Db6mUeUNSGI6uGt?=
 =?us-ascii?Q?HaBvOeIe+5FX54aNQ7LXpOKSgrxGxxSUW/uo/2jpKBsC9nGC3Df2yKBrOiWl?=
 =?us-ascii?Q?qx8e8s/CBgcb0AbH1hl2eRQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB3365E360F3FCDE639F3D2D1E8B50ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6694b4c5-b5b2-43e0-431d-08db67e89589
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 06:21:24.1796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PQJ5r5Uf2mjXoBKAinN9kNC6FZ2QmpE7L+zmWqZ6sZ+2qfJbqqCYlDJv9WKPmWeZ0znrTslrVXLzc4xLMFcvsFF+XydwyZ+dUx0QomE0Ml0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4609
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

--_000_SG2PR06MB3365E360F3FCDE639F3D2D1E8B50ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

        > The code says:

        > In Aspeed AST2600 SoC features 16 TACH controllers, with each
        > controller capable of supporting up to 1 input.

        > which is a bit different. I guess there are no examples anymore,
        > but I'd really like to see how this looks like in the devicetree =
file,
        > and how the driver is supposed to distinguish/select the 16 input=
s.
Hi Roeck,

The node in the devicetree file will looks like following:

tach0: tach0@1e610008 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610008 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach0_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach1: tach1@1e610018 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610018 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach1_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach2: tach2@1e610028 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610028 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach2_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach3: tach3@1e610038 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610038 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach3_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach4: tach4@1e610048 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610048 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach4_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach5: tach5@1e610058 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610058 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach5_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach6: tach6@1e610068 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610068 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach6_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach7: tach7@1e610078 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610078 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach7_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach8: tach8@1e610088 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610088 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach8_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach9: tach9@1e610098 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610098 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach9_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach10: tach10@1e6100A8 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e6100A8 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach10_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach11: tach11@1e6100B8 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e6100B8 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach11_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach12: tach12@1e6100C8 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e6100C8 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach12_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach13: tach13@1e6100D8 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e6100D8 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach13_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach14: tach14@1e6100E8 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e6100E8 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach14_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

tach15: tach15@1e6100F8 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e6100F8 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach15_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
        status =3D "disabled";
};

Thanks
Best Regards,
Billy Tsai


--_000_SG2PR06MB3365E360F3FCDE639F3D2D1E8B50ASG2PR06MB3365apcp_
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
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<body lang=3D"en-TW" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; The code says:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; In Aspeed AST2600 SoC features 16 TACH control=
lers, with each<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; controller capable of supporting up to 1 input=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; which is a bit different. I guess there are no=
 examples anymore,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; but I'd really like to see how this looks like=
 in the devicetree file,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; and how the driver is supposed to distinguish/=
select the 16 inputs.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Hi <=
/span><span style=3D"font-size:12.0pt;color:black">Roeck</span><span lang=
=3D"EN-US" style=3D"font-size:12.0pt;color:black">,</span><span lang=3D"EN-=
US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The node in the dev=
icetree file will looks like following:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach0: tach0@1e6100=
08 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610008 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach0_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach1: tach1@1e6100=
18 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610018 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach1_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach2: tach2@1e6100=
28 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610028 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach2_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach3: tach3@1e6100=
38 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610038 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach3_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach4: tach4@1e6100=
48 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;reg =3D &lt;0x1e610048 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach4_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach5: tach5@1e6100=
58 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610058 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach5_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach6: tach6@1e6100=
68 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &nbsp;reg =3D &lt;0x1e610068 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach6_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach7: tach7@1e6100=
78 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610078 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach7_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach8: tach8@1e6100=
88 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610088 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach8_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach9: tach9@1e6100=
98 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610098 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach9_default&gt;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach10: tach10@1e61=
00A8 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e6100A8 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach10_default&gt;;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach11: tach11@1e61=
00B8 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e6100B8 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach11_default&gt;;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach12: tach12@1e61=
00C8 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e6100C8 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach12_default&gt;;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach13: tach13@1e61=
00D8 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e6100D8 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach13_default&gt;;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach14: tach14@1e61=
00E8 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e6100E8 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach14_default&gt;;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">tach15: tach15@1e61=
00F8 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e6100F8 0x8&gt;;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach15_default&gt;;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Than=
ks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Best=
 Regards, <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Bill=
y Tsai<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB3365E360F3FCDE639F3D2D1E8B50ASG2PR06MB3365apcp_--
