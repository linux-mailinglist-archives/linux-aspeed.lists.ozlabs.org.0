Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A849813B58
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Dec 2023 21:13:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lMX4kd64;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srk845NcRz3cTL
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Dec 2023 07:13:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lMX4kd64;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srk7s2bb3z3cBW
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Dec 2023 07:13:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03902CE25E2
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Dec 2023 20:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B7AC433C7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Dec 2023 20:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702584820;
	bh=DE5oZHxnY2FnfLLm9CrhQ8lZCYG3nLE1BorF38WzfFU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lMX4kd644bIlS6xHthUPx3lzX6oBV9QIy6BIKzgaViOifgtAh/k2u9cfDMaEzACnt
	 E5fHR8of47LzoARnWcMdcaepUZWRlqUJD6OLm9ZbDstb0xRVq+kiIBC3mtiUPQDS6m
	 yPR2SYtkmcoyry2U8jmZQXjOm5T7aiyA7+NHSvwWBXDP6YZPix++gMpzD1wPq36QFG
	 fkQuCJk/Qa4WOqDlMoEyD3Rcf7kKWNbWPN315DWuoa1riWVsbi3z+gd65UqPoajG0l
	 ZlR5nKAj/GWWZ9tWiO1mxpjI5fyTmMlr9oFB2Oh6bsYABWliA7uU+uAMQqO75s7ic7
	 RKBGdOacdeqCw==
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c4846847eso47914645e9.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Dec 2023 12:13:40 -0800 (PST)
X-Gm-Message-State: AOJu0YzZNAUUIEu1LFAqk8heOvP3Txs6rdEPWzyHn2MnnSX9OwQxTSrA
	B1nXPVmMpOqgwBehmrPm01k4s+eKmJEfKt0XZQ==
X-Google-Smtp-Source: AGHT+IHDKZo8Iz9evcWsSlbRyWsjf9ZmHonlKRtMaMEtFTEvbkKWDgkxQU9xVlEHJQrHQKr9MJyv9JPsWzfEzSGK/Wg=
X-Received: by 2002:a05:6512:2019:b0:50b:d764:8046 with SMTP id
 a25-20020a056512201900b0050bd7648046mr4254179lfb.121.1702584796440; Thu, 14
 Dec 2023 12:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20231212164004.1683589-1-ninad@linux.ibm.com> <20231212164004.1683589-3-ninad@linux.ibm.com>
 <20231212-amusement-elevation-28e42bcccc35@spud> <d8b5df1c-c732-4cf3-ae28-cc2017d3b0b6@linux.ibm.com>
 <20231214-stopper-bounce-ca9002869293@spud>
In-Reply-To: <20231214-stopper-bounce-ca9002869293@spud>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Dec 2023 14:13:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJCbRREnUyKkvkutyWP2GYK2ZqzfC1TS1pwQ=4xY_1J5w@mail.gmail.com>
Message-ID: <CAL_JsqJCbRREnUyKkvkutyWP2GYK2ZqzfC1TS1pwQ=4xY_1J5w@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] dt-bindings: tpm: Add schema for TIS I2C devices
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Dec 14, 2023 at 10:35=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Dec 14, 2023 at 09:34:39AM -0600, Ninad Palsule wrote:
> > Hello Conor,
> >
> > On 12/12/23 11:14, Conor Dooley wrote:
> > > Hey,
> > >
> > > On Tue, Dec 12, 2023 at 10:39:58AM -0600, Ninad Palsule wrote:
> > > > From: Johannes Holland <johannes.holland@infineon.com>
> > > >
> > > > Add a dt schema to support device tree bindings
> > > "Add bindings for..."
> > Fixed.
> > >
> > > > for the generic I2C
> > > > physical layer. Refer to the TCG PC Client Platform TPM Profile (PT=
P)
> > > > Specification for TPM 2.0 v1.04 Revision 14.
> > > >
> > > > This includes descriptions for the Nuvoton and Infineon devices.
> > > >
> > > > OpenBMC-Staging-Count: 3
> > > I have no idea what this is, but it needs to be removed from the patc=
h.
> > Removed.
> > >
> > > > Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
> > > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > > > ---
> > > >   .../bindings/security/tpm/tpm-tis-i2c.yaml    | 50 ++++++++++++++=
+++++
> > > >   1 file changed, 50 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/security/tpm=
/tpm-tis-i2c.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-tis=
-i2c.yaml b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> > > > new file mode 100644
> > > > index 000000000000..de1e34065748
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.ya=
ml
> > > > @@ -0,0 +1,50 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/security/tpm/tpm-tis-i2c.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: I2C PTP based TPM Devices
> > > > +
> > > > +maintainers:
> > > > +  - Johannes Holland <johannes.holland@infineon.com>
> > > > +
> > > > +description:
> > > > +  Device Tree Bindings for I2C based Trusted Platform Module (TPM)=
.
> > > s/Device Tree Bindings for //. Doesn't dt_binding_check now complain =
if
> > > you have this in a title or description?
> > Fixed.
> > >
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^tpm(@[0-9a-f]+)?$"
> > > > +
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - description: Infineon's Trusted Platform Module (TPM) (SLB=
9673).
> > > > +        items:
> > > > +          - const: infineon,slb9673
> > > > +          - const: tcg,tpm-tis-i2c
> > > > +      - description: Nuvoton's Trusted Platform Module (TPM) (NPCT=
75x).
> > > > +        items:
> > > > +          - const: nuvoton,npct75x
> > > > +          - const: tcg,tpm-tis-i2c
>
> Also, another thought - the bus is not usually encoded in the compatible
> string, so it would be good to remove that.

True, but we already have 3 different bus variants in this case. So
that ship has sailed.

Rob
