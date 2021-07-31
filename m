Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B43DE671
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Aug 2021 07:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf41Z1LHXz30B7
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Aug 2021 15:58:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcWKM25PQz301q
 for <linux-aspeed@lists.ozlabs.org>; Sun,  1 Aug 2021 03:21:59 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B92D60F94;
 Sat, 31 Jul 2021 17:21:50 +0000 (UTC)
Date: Sat, 31 Jul 2021 18:24:29 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 2/8] dt-bindings: iio: adc: Binding ast2600 adc.
Message-ID: <20210731182334.2be68876@jic23-huawei>
In-Reply-To: <8D93D26B-AE57-4E38-A1AD-FA62894F2947@aspeedtech.com>
References: <20210723081621.29477-1-billy_tsai@aspeedtech.com>
 <20210723081621.29477-3-billy_tsai@aspeedtech.com>
 <20210723155141.000039ee@Huawei.com>
 <8D93D26B-AE57-4E38-A1AD-FA62894F2947@aspeedtech.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Aug 2021 15:58:34 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"  <linux-aspeed@lists.ozlabs.org>, "@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org\"          <linux-arm-kernel@lists.infradead.org>, "@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 26 Jul 2021 07:21:29 +0000
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Hi Jonathan,
>=20
> Thanks for your review. I will fix them.
> About the vref I reply inline.
>=20
> On 2021/7/23, 10:52 PM, "Jonathan Cameron" <Jonathan.Cameron@Huawei.com> =
wrote:
>=20
>     On Fri, 23 Jul 2021 16:16:15 +0800
>     Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>=20
>     >   > +  =E2=80=A2 Internal or External reference voltage.
>     >   > +  =E2=80=A2 Support 2 Internal reference voltage 1.2v or 2.5v.
>     >   > +  =E2=80=A2 Integrate dividing circuit for battery sensing.
>     >   > =20
>     >   >  properties:
>     >   >    compatible:
>     >   >      enum:
>     >   >        - aspeed,ast2400-adc
>     >   >        - aspeed,ast2500-adc
>     >   > +      - aspeed,ast2600-adc
>     >   > =20
>     >   >    reg:
>     >   >      maxItems: 1
>     >   > @@ -33,6 +45,18 @@ properties:
>     >   >    "#io-channel-cells":
>     >   >      const: 1
>     >   > =20
>     >   > +  vref:
>     >   > +    minItems: 900
>     >   > +    maxItems: 2700
>     >   > +    default: 2500
>     >   > +    description:
>     >   > +      ADC Reference voltage in millivolts. =20
>=20
>     >   I'm not clear from this description.  Is this describing an exter=
nally
>     >   connected voltage reference?  If so it needs to be done as a regu=
lator.
>     >   If it's a classic high precision reference, the dts can just use
>     >   a fixed regulator. =20
>=20
> In the ast2600, the ADC supports two internal reference voltages of 1.2v =
or 2.5v,
> as well as external voltages. When the user selects a voltage of 1.2v or =
2.5v, my
> driver will first select to use the internal voltage.=20

Understood.

> As you mention at patch #4, you suggest to use two property to handle thi=
s feature.
> vref: indicate the regulator handler. Like other dt-bindings used.

vref-supply would be the binding but otherwise yes.

> aspeed,int_vref_mv: indicate the chosen of 1.2v or 2.5v
> and use "model_data->vref_fixed" to exclude ast2400 and ast2500
> Is it right?
Ideally you would check in the driver and also use something here
to allow device trees to be checked automatically.  Something like

allOf:
 - if:
     not:
       properties:
         compatible:
           contains: const: aspeed,ast2600-adc
             then:
               int_vref_mv: false

that will ensure the property is only used for the ast2600.

Note the above is from memory, so may well have incorrect syntax.
I've never found yaml intuitive!

Thanks,


Jonathan

        =20
>=20
> Thanks
>=20
>     >   > +
>     >   > +  battery-sensing:
>     >   > +    type: boolean
>     >   > +    description:
>     >   > +      Inform the driver that last channel will be used to sens=
or battery. =20
>=20
>     >   This isn't (I think?) a standard dt binding, so it needs a manufa=
cturer
>     >   prefix. =20
>=20
>     >   aspeed,battery-sensing =20
>=20
> Best Regards,
> Billy Tsai
>=20
>=20

