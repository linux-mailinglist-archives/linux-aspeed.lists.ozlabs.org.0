Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB9D3D3C09
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 16:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWXNL3Gq1z30DX
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Jul 2021 00:52:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.79.56;
 helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 407 seconds by postgrey-1.36 at boromir;
 Sat, 24 Jul 2021 00:52:15 AEST
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWXNH2lfvz2yP5
 for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Jul 2021 00:52:13 +1000 (AEST)
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GWX9n6026z6G9Fh;
 Fri, 23 Jul 2021 22:43:09 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 23 Jul 2021 16:52:06 +0200
Received: from localhost (10.210.170.238) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Fri, 23 Jul
 2021 15:52:05 +0100
Date: Fri, 23 Jul 2021 15:51:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 2/8] dt-bindings: iio: adc: Binding ast2600 adc.
Message-ID: <20210723155141.000039ee@Huawei.com>
In-Reply-To: <20210723081621.29477-3-billy_tsai@aspeedtech.com>
References: <20210723081621.29477-1-billy_tsai@aspeedtech.com>
 <20210723081621.29477-3-billy_tsai@aspeedtech.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.210.170.238]
X-ClientProxiedBy: lhreml704-chm.china.huawei.com (10.201.108.53) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 lars@metafoo.de, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 robh+dt@kernel.org, pmeerw@pmeerw.net, jic23@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 23 Jul 2021 16:16:15 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> This patch add more description about aspeed adc and add two property
> for ast2600:
> - vref: used to configure reference voltage.
> - battery-sensing: used to enable battery sensing mode for last channel.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Hi Billy,

A few comments inline.

Thanks,

Jonathan

> ---
>  .../bindings/iio/adc/aspeed,adc.yaml          | 28 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml b/=
Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml
> index 23f3da1ffca3..a562a7fbc30c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml
> @@ -10,14 +10,26 @@ maintainers:
>    - Joel Stanley <joel@jms.id.au>
> =20
>  description:

I think you need a | after description if you want the formatting to be
maintained (otherwise it will undo the line breaks).

> -  This device is a 10-bit converter for 16 voltage channels.  All inputs=
 are
> -  single ended.
> +  =E2=80=A2 10-bits resolution for 16 voltage channels.
> +  At ast2400/ast2500 the device has only one engine with 16 voltage chan=
nels.
> +  At ast2600 the device split into two individual engine and each contai=
ns 8 voltage channels.

Please wrap lines at 80 chars unless it badly hurts readability.
engines

> +  =E2=80=A2 Channel scanning can be non-continuous.
> +  =E2=80=A2 Programmable ADC clock frequency.
> +  =E2=80=A2 Programmable upper and lower bound for each channels.

I would use threshold rather than bound.   A bound restricts the
value, and I think this is measuring it?

> +  =E2=80=A2 Interrupt when larger or less than bounds for each channels.
> +  =E2=80=A2 Support hysteresis for each channels.
> +  =E2=80=A2 Buildin a compensating method.

Built-in=20

> +  Additional feature at ast2600

of ast2600

> +  =E2=80=A2 Internal or External reference voltage.
> +  =E2=80=A2 Support 2 Internal reference voltage 1.2v or 2.5v.
> +  =E2=80=A2 Integrate dividing circuit for battery sensing.
> =20
>  properties:
>    compatible:
>      enum:
>        - aspeed,ast2400-adc
>        - aspeed,ast2500-adc
> +      - aspeed,ast2600-adc
> =20
>    reg:
>      maxItems: 1
> @@ -33,6 +45,18 @@ properties:
>    "#io-channel-cells":
>      const: 1
> =20
> +  vref:
> +    minItems: 900
> +    maxItems: 2700
> +    default: 2500
> +    description:
> +      ADC Reference voltage in millivolts.

I'm not clear from this description.  Is this describing an externally
connected voltage reference?  If so it needs to be done as a regulator.
If it's a classic high precision reference, the dts can just use
a fixed regulator.

> +
> +  battery-sensing:
> +    type: boolean
> +    description:
> +      Inform the driver that last channel will be used to sensor battery.

This isn't (I think?) a standard dt binding, so it needs a manufacturer
prefix.

aspeed,battery-sensing

> +
>  required:
>    - compatible
>    - reg

