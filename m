Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D69727B00
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 11:15:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcJTl212Mz3dxw
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 19:15:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=uAukNU7U;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::71a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=uAukNU7U;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcJTd4RB7z3dwG
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 19:15:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiT2R/IWIsUotSdhu3XvIw4ab4bXLgTnyeooxHTMOxR7lcPyNziBtZ23IxYxJkXfi5zQ1FsNiI3baTNEfAASK7Q9I49j3TWpuWDoBmeUFQFXj/b09R0SMwbeM1tFJ6gZtD9ZErrPtHB1DKlU7EpUMBHTmxuAOpu9PQrwXUIWUnCUqPQKx2cxXqx3CpoklQPPzQlS2AzHSiHtrtlGPdFKUhskR4ROt3iKpHpAb/tJvuk7fjXRs0THZ90tQDw173lu+UzFRZ0hu4/0gUQVynFb7BcndLtXHNuSS7xiHNpKjAfc2p9I6uVDAFIL95rMla3u0Sg6aw2o0FSmrD6qDIfLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaMKmCA8GOJ7pH8S3Uj9wvv/jpyJYdvnQzeOeuHy0RM=;
 b=gUP81Od3IgdoorowfugYc/hB9ixICxQTP8eoLn/8D/NJPDJlXfL8GdARQu46ca7nbcyo5Ew4FbCIk2FlwJ9uq080XRgSLFaTPpd1wRAKT14YREz6YrP+OwMhV5HtzkmlhDI+thEKUPeOn7LvrwfT1YQ2w8fNa7jsSmIfO0ppViysbgbb4ClAoER4YeKqkZ5wH60uKfSAz53ev5BhbNN/Cn3fp7yUPbFswnmOc13aBhJET3IqB0A1nCODb25r5bYWD75FGUmByqhiTGC4p1WEpV0/QB2F8VcleSsvXaOVkOyjx4tAK6JlKM4g/yDjf6zLClCVeKBRzQr/iofbnLZKOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaMKmCA8GOJ7pH8S3Uj9wvv/jpyJYdvnQzeOeuHy0RM=;
 b=uAukNU7Uvf3EcNCmBJZvMGSpmL62AaXJO/3FdMdkxPoYZCUGxPyBNVhsIii//6tTNGBn0/eaWrHzMFKUnnzOKO7+h5w4ijQhqE5ujRfZ3ttF8Mi8kk2WVHVeb4FwqPA+VhnZNSGd7pO310m6PGMRoCxr1zRRmFCxEfITroMyAx7ovorvzWwR/Va4Xuj5w8Da6ggisKkrdomi1KncMnqruC3OfQ8b9S9DI6qcLONLWgA6SbzPfmnNEHPlS1srhOwbYt/24NWdDzn5GTWric+bP8ztLoNbmVc4mJye4+/NXAO6bWpEQ0yOnRjnlfTm6yvOSz2M/WWxGpz/RsWq226Ssw==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SG2PR06MB5382.apcprd06.prod.outlook.com (2603:1096:4:1d5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Thu, 8 Jun 2023 09:15:11 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 09:15:11 +0000
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
Thread-Index:  AQHZma8+6LJZhu/Vfk6W8iuVf8iT56+AdouAgAAQppOAAAI2gIAAA3JlgAAJUYCAAAi8Tw==
Date: Thu, 8 Jun 2023 09:15:11 +0000
Message-ID:  <SG2PR06MB3365558F9A3127744CEF1C068B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
 <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
 <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
 <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <fb3cb26b-61d7-5f57-41de-f419aa50ac0b@linaro.org>
In-Reply-To: <fb3cb26b-61d7-5f57-41de-f419aa50ac0b@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|SG2PR06MB5382:EE_
x-ms-office365-filtering-correlation-id: 82d155fe-2bed-4981-9e85-08db6800dca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  i+LopZt0nSAliHD8RrrzKFk/Rb8vVxYksK8ZJFErpKJA/xvg9rEALVPFfdH0ZcwoKhC1gaexJn4p/pwmh5kxl9DOc8EGRqpa1BIrwqvfXQespq9Wk4UScVLzlVCGYcw3BoM+6zOHE+dey1mBQyB7enqiXlAn0C7jpeel9A59zqdkhQq5jeO52+FmBj+MbiY7s5Kgfmf9PSTa/JJPw0gG9xFd9RxpNCGADK7xiRuUZLTXtsWu2QuMMMWY42K5VhJ2jmbZ4+yOKiRPjaDaXRqmHteq7p62foxe3V2lL7UK7wpMLo1J/MczkPPkTFe8xd3CR5rVbfoA9N2Z3/6QJDEb5l/xHvQiiuI6IExIDgk7uNfnRlqBIhcZwD8LMkU6Y+WpCBOP6E81vZ9j9ENhKmkwFmN4Vnj9cvgDZf7ViN81cddWLnicwPjvCehgS0+9/Ov1xexyAEAhH/JFhLQzap4zuplrVBitwTbSRzzRD8B19onUPY4MQIn9IH7cpaZMo3ue4vS1F8lSH47R+ZytIxonxfSI7BGnezudGNqaT/kQF0lCg7j+ff5mU3z4FWZzKX+YSC1bJTVkZktE86OIaHSguruaK3HgGI+moXHjo+09XlMyQKHGPiCew2lC8ikYwq5XStD7nv4nVXua64FIHlgR6A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(136003)(39850400004)(346002)(451199021)(2906002)(41300700001)(53546011)(9686003)(55236004)(6506007)(38100700002)(7696005)(186003)(26005)(83380400001)(8936002)(66556008)(478600001)(110136005)(71200400001)(64756008)(66476007)(66446008)(122000001)(76116006)(66946007)(55016003)(316002)(91956017)(921005)(5660300002)(8676002)(52536014)(33656002)(38070700005)(86362001)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?L5G+JaEUlDujRuz0xVB5gyEx36DdagHfjNWvYIvWo58yUWBnONwBu4rE21QI?=
 =?us-ascii?Q?85K3y/+dBaVhsoIuiwv5gv2hRICjYXhmxfoSVw4zfWWQG01ryg66BHDJ2lIu?=
 =?us-ascii?Q?9Q6f7+KSkH2nUwCqrYR8hOVCIkkQHl2qAcOc1IvyRS6WpDdgbV9xVihfhmLo?=
 =?us-ascii?Q?lrdHf5nWyilF7PaCKPUSoDY+g2dwu/jZRBeWuot+4caBjB/WrVnLzBYTGHVC?=
 =?us-ascii?Q?GSm6lyarJcqNrEoeJRoNqkcK7Sg+xA9fQJ9sR7TX6AO4GniGxpZFmjce548y?=
 =?us-ascii?Q?OOLz8yO9wWiMdyQJR2cBGeQ+tFTOxWYoLRqlqwHtCzRsvjz1rwyqasAU17Sy?=
 =?us-ascii?Q?6TRvs1h64n836VId7VDuT4IMEWQEDMsJmSMBDi9Av5y5wdiVApBYgufruD3p?=
 =?us-ascii?Q?uBuZAOGGrGqlQ1v+tA5oC6D06hOZzZme8Oek8Nv3r4uRUHC28Qy7sIOd9b1g?=
 =?us-ascii?Q?AFHM+TI+GBbYVUHmb+i9ph1afNaG6eNrBJQCwSiOafxlSAq0kz61B+XbrXYe?=
 =?us-ascii?Q?v7zo8B+O4xjHzWk/70oHH8SNwojAU3yL13QuHuO8H++xcO04WAlH7JwKgFmr?=
 =?us-ascii?Q?qXdbdAp4gwbprKH88JZ/It7n4HASFSi4RSR3L83NgwEkIhIqb/JJDUeXX1Lf?=
 =?us-ascii?Q?Pw+ji4eBE1ERWohoMi3RJbRg+7huG4lKnZpKil00PcOsM0Ky+lNGjtst8XSp?=
 =?us-ascii?Q?dmYfSO4c3sckGUd+WTm6VV8AFqwF9nAAzxKgQlflxnjRqqAU/wes9ZdX9Wme?=
 =?us-ascii?Q?Gw7YHPc728yNa5prRee0GSgXTj1XnHV2r01YWgC5XKhSHeKezuNIi7MYj1bM?=
 =?us-ascii?Q?mGEPJTN0pfXY9lkxepJmwLGMo1HUGMyLG4wTHkb5cbF2OWr9cNnEsNaUiv5P?=
 =?us-ascii?Q?RfVCOe3A5DOD9Q/lK/oPsa5yPoHEQNn9VNWHIiK4o2UNaSvX25d/j0kog0AT?=
 =?us-ascii?Q?xt/vG/0F6F1aJwN8iG2v0octsqNZ5mlyx1Hgk7H/rHwb4N1iTNl9mWPYK/lD?=
 =?us-ascii?Q?hM6bBnHZv6ZkHEDX7pgw+ghXmmVkIGeHlnz55oEyFQ3p/GnckAWNVPRHAh2u?=
 =?us-ascii?Q?IsxkTj96SR5eC4u642d8/Eq3QuC5/jDlMZLbIEOq22iN3hDlnJvuNoddzQAV?=
 =?us-ascii?Q?g6bkj9QPm6dhT7jWOKVEC0eApWdP4dJ+DXRmunnZ7+ZxoiUWW4TwDvQqUE4W?=
 =?us-ascii?Q?rhokvcKLbf5OX3iT0pAhjFf1DjOVOW0Yh36z302m1kwHDbdwJJYNZlH7BkmP?=
 =?us-ascii?Q?qsqLH+AV4o204rc1tEm5ugKhwa3zD4wxw1L4d5X9yHxCyZgQYSYG5sP7ip8K?=
 =?us-ascii?Q?DGwwkFVgbDtw97hiz/UFU1tF+3gZxb4IneDk7ZxTkGVr/TQ4jw71EI4KJrFd?=
 =?us-ascii?Q?H6aZiKSNcn3KCnNs3oxsLxGasHshmD2IQgiOoz8pA3WEAqnQ+x2t3gyCkmHa?=
 =?us-ascii?Q?ZtLWfC0NLEYz+Xx717dWnW4BOT8MBo0nB73G6g0n3vo/Myi3heOrG3tgE8HD?=
 =?us-ascii?Q?RUA2amBR8N6GbaujHHUuhsUgIKfKBe7xWeLZEAXqap4txW8PO/9GUm3trlaD?=
 =?us-ascii?Q?nsSfWLKgJeIuCVC4cDbku+r0pi4THcE/SHrmNqLOCNbaDLMHEgvDsOCaclHz?=
 =?us-ascii?Q?7gbRvy1xp7RWio7NK9f5bVQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB3365558F9A3127744CEF1C068B50ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d155fe-2bed-4981-9e85-08db6800dca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 09:15:11.3479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkDt/6bZznkKi9dnCBY3mNbU4JOhDEnDDLRiAwJ7sTjSJgrZSLLYWDjG2dQIHEnxYoS1CCKTGKBUQcNkReRr9I4au68q/wnbGrRW8v4uIHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5382
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

--_000_SG2PR06MB3365558F9A3127744CEF1C068B50ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 08/06/2023 10:21, Billy Tsai wrote:
        >>         On 08/06/2023 09:47, Billy Tsai wrote:
        >>         >>
        >>         >>   >> +
        >>         >>   >> +allOf:
        >>         >>   >> +  - $ref: pwm.yaml#
        >>         >>   >> +
        >>         >>   >> +properties:
        >>         >>   >> +  compatible:
        >>         >>   >> +    enum:
        >>         >>   >> +      - aspeed,ast2600-pwm
        >>         >>   >> +
        >>         >>   >> +  "#pwm-cells":
        >>         >>   >> +    const: 3
        >>         >>
        >>         >>   > 3 cells? For one PWM? What are they?
        >>         >>
        >>         >> channel, period and polarity.
        >>
        >>         > Don't cut my responses. You wrote you have one PWM out=
put, so only one
        >>         > channel. What do you put then in the channel?
        >>
        >> You need to put 0 in the cell of the channel, the example of the=
 dts usage will like following:
        >>
        >> pwm0: pwm0@1e610000 {
        >>         compatible =3D "aspeed,ast2600-pwm";
        >>         reg =3D <0x1e610000 0x8>;
        >>         #pwm-cells =3D <3>;
        >>         #address-cells =3D <1>;
        >>         #size-cells =3D <0>;
        >>         pinctrl-names =3D "default";
        >>         pinctrl-0 =3D <&pinctrl_pwm0_default>;
        >>         clocks =3D <&syscon ASPEED_CLK_AHB>;
        >>         resets =3D <&syscon ASPEED_RESET_PWM>;
        >>         status =3D "okay";
        >> };
        >>
        >> pwm1: pwm1@1e610010 {
        >>         compatible =3D "aspeed,ast2600-pwm";
        >>         reg =3D <0x1e610010 0x8>;
        >>         #pwm-cells =3D <3>;
        >>         #address-cells =3D <1>;
        >>         #size-cells =3D <0>;
        >>         pinctrl-names =3D "default";
        >>         pinctrl-0 =3D <&pinctrl_pwm1_default>;
        >>         clocks =3D <&syscon ASPEED_CLK_AHB>;
        >>         resets =3D <&syscon ASPEED_RESET_PWM>;
        >>         status =3D "okay";

        > BTW, these are not two PWM devices but one. I don't understand wh=
y you
        > changed previous design into something like this, but this is not
        > representing your hardware.

The previous design of my patch treated our PWM controller as having 16 PWM=
 channels.
However, from a hardware perspective, it consists of 16 individual PWM chip=
s, each
with its own set of two 4-byte control registers. These chips operate indep=
endently
and are not affected by each other.

--_000_SG2PR06MB3365558F9A3127744CEF1C068B50ASG2PR06MB3365apcp_
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
<body lang=3D"en-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On 08/06/2023 10:21=
, Billy Tsai wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; On 08/06/2023 09:47, Billy Tsai wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +allOf:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; - $ref: pwm.yaml#<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +properties:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; compatible:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp; enum:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - aspee=
d,ast2600-pwm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; &quot;#pwm-cells&quot;:<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp; const: 3<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt; 3 cells? For one PWM? What are they?<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt; channel, period and polarity.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &gt; Don't cut my responses. You wrote you have one PWM output, =
so only one<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt; channel. What do you put then in the channel?<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; You need to put 0 in the cell of the =
channel, the example of the dts usage will like following:<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; pwm0: pwm0@1e610000 {<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; compatible =3D &quot;aspeed,ast2600-pwm&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; reg =3D &lt;0x1e610000 0x8&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; #pwm-cells =3D &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_pwm0_default&gt;;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; };<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; pwm1: pwm1@1e610010 {<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; compatible =3D &quot;aspeed,ast2600-pwm&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; reg =3D &lt;0x1e610010 0x8&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; #pwm-cells =3D &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_pwm1_default&gt;;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&gt; BTW, these are not two PWM devices but one. I =
don't understand why you<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; changed previous design into something like th=
is, but this is not<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; representing your hardware.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The previous design=
 of my patch treated our PWM controller as having 16 PWM channels.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">However, from a har=
dware perspective, it consists of 16 individual PWM chips, each
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">with its own set of=
 two 4-byte control registers. These chips operate independently
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">and are not affecte=
d by each other.<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB3365558F9A3127744CEF1C068B50ASG2PR06MB3365apcp_--
