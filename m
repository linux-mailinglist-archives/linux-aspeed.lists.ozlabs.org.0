Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 702D8675CF
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 22:19:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lklv5MntzDr0K
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Jul 2019 06:19:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lklT1d4zzDqXv
 for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Jul 2019 06:18:44 +1000 (AEST)
X-AuditID: ac10606f-d27ff70000003324-2c-5d28eb20fe7f
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 2A.D9.13092.02BE82D5; Fri, 12 Jul 2019 16:18:40 -0400 (EDT)
Received: from ATLMS2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb]) by
 atlms1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605%12]) with mapi id
 14.03.0415.000; Fri, 12 Jul 2019 16:18:40 -0400
From: Hongwei Zhang <Hongweiz@ami.com>
To: Andrew Jeffery <andrew@aj.id.au>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, Linus Walleij
 <linus.walleij@linaro.org>
Subject: RE: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
Thread-Topic: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
Thread-Index: AQHVMdoYoxHDUhbFgEKYqLGYV+TuK6bDajmAgAQPB2A=
Date: Fri, 12 Jul 2019 20:18:39 +0000
Message-ID: <14D3C8298A3B0F42A1EB31EE961CFF82AA8F46AD@atlms2.us.megatrends.com>
References: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
 <9c998f5f-42ef-43bd-b024-839ee00126de@www.fastmail.com>
In-Reply-To: <9c998f5f-42ef-43bd-b024-839ee00126de@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWyRiBhgq7Ca41Yg2ddlha7LnNYzD9yjtXi
 9/m/zBZT/ixnsmhefY7Z4vKuOWwWS69fZLJo3XuE3YHD42r7LnaPNfPWMHpc/HiM2WPTqk42
 jzvX9rB5nJ+xkNHj8ya5APYoLpuU1JzMstQifbsEroyJXbeZCnZLV8y/+4utgXGeWBcjJ4eE
 gInE77YNLCC2kMAuJonpTZVdjFxA9mFGiRsHJrOCJNgE1CSe/mlgB0mICKxhlLh59igjiMMs
 cJZRYs2lL8wgVcICPhInfi4HGyUi4CvRfaaFEcK2kthwpRksziKgKvHg8H8mEJtXwF/iat8M
 dojVVRIrdveAbeMUcJFYMm0LG4jNKCAm8f3UGrB6ZgFxiVtP5jNBnC0gsWTPeWYIW1Ti5eN/
 rBC2kkTDin9Q9ToSC3Z/YoOwtSWWLXzNDLFXUOLkzCcsExhFZyEZOwtJyywkLbOQtCxgZFnF
 KJRYkpObmJmTXm6kl5ibqZecn7uJERKP+TsYP340P8TIxMF4iFGCg1lJhHfVf/VYId6UxMqq
 1KL8+KLSnNTiQ4zSHCxK4ryr1nyLERJITyxJzU5NLUgtgskycXBKNTDOuNgu7FYhZ62Vr6Pq
 paWRFbEkjbs2XfKugNzi21e3xUjVbLjafTqRc3HIdtGHGWXSfLwpk/dmy91riZzT2Lfkg/vV
 fxaJzdebb7861LTeOGKN49vGJ3Vbvn9TvLlxxb4XpQaHNl1TS34WsVFsVZl5hPgsbbfv5V8c
 GR9tV9GYu2/Z4d9hn/mVWIozEg21mIuKEwGO1G0stQIAAA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Thanks for your review, Andrew,

Just submitted an updated binding document, with new proper subject line:

[PATCH 2/3 v2] dt-bindings: gpio: aspeed: Add SGPIO support

Regards,
--Hongwei

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Tuesday, July 9, 2019 10:16 PM
To: Hongwei Zhang <Hongweiz@ami.com>; devicetree@vger.kernel.org; Joel Stan=
ley <joel@jms.id.au>; Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; =
linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
Subject: Re: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO suppor=
t



On Thu, 4 Jul 2019, at 05:31, Hongwei Zhang wrote:
> Add bindings to support SGPIO on AST2400 or AST2500.
>=20
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 36 ++++++++++++++++=
++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> new file mode 100644
> index 0000000..f5fc6ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> @@ -0,0 +1,36 @@
> +Aspeed SGPIO controller Device Tree Bindings
> +-------------------------------------------
> +
> +Required properties:
> +- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
> +
> +- #gpio-cells 		: Should be two
> +			  - First cell is the GPIO line number
> +			  - Second cell is used to specify optional
> +			    parameters (unused)
> +
> +- reg			: Address and length of the register set for the device
> +- gpio-controller	: Marks the device node as a GPIO controller.
> +- interrupts		: Interrupt specifier (see interrupt bindings for
> +			  details)
> +- interrupt-controller	: Mark the GPIO controller as an=20
> interrupt-controller

As this is a serial GPIO controller, a critical piece of configuration info=
rmation is how many GPIOs we wish to serialise. This is done in multiples o=
f 8, up to 80 pins.

The bindings need to describe the "ngpios" property from the generic GPIO b=
indings and how this affects the behaviour of the controller.

We also need to add the "bus-frequency" property here to control the rate o=
f SGPMCK.

> +
> +Optional properties:
> +
> +- clocks                : A phandle to the clock to use for debounce=20
> timings

We need this, but not for the reason specified, and it should be a required=
 property. We need PCLK (the APB clock) to derive the SGPIO bus frequency. =
Despite what the datasheet blurb says, there's no debounce control for the =
SGPIO master (this is a copy/paste mistake from the description of the para=
llel GPIO master).

> +
> +The sgpio and interrupt properties are further described in their
> respective
> +bindings documentation:
> +
> +- Documentation/devicetree/bindings/sgpio/gpio.txt
> +-=20
> +Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +
> +  Example:
> +	sgpio@1e780200 {
> +		#gpio-cells =3D <2>;
> +		compatible =3D "aspeed,ast2500-sgpio";
> +		gpio-controller;
> +		interrupts =3D <40>;
> +		reg =3D <0x1e780200 0x0100>;
> +		interrupt-controller;
> +	};

You'll need to fix up the example after making the changes mentioned above.

Andrew

> --
> 2.7.4
>=20
>
