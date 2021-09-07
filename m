Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D782240319B
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 01:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H42035WhRz2yHR
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 09:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pYDS1l8N;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pYDS1l8N; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H42001DD1z2xry
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Sep 2021 09:43:28 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id n2so1188843lfk.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Sep 2021 16:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qbR0azSstYv0bM0YwB+7IFgxmLnd5oQnRM84XNbUsk4=;
 b=pYDS1l8NObhJyvqxmZqxvZxKoo1kfcKoWMP3+vJb6jmJGhNVePTwqs4/vLcjzkJqnx
 fu4RydoJpB+3lcFKabShYNgEG5iEzVNdc4INJkL9JHLl0PkYexdy+f0B+iQOlW33ZnWQ
 6za0Qe6PU/vixhDJoh1Al7mUqxQmYWADRzFiFt/oxfzbH32iM+34Zvp+DbrteH+Gt6sy
 KtM1vCG6F6V04Ptk/vyylwaqydOp4uVEXawSEGwB7CS6I9OGFvZFRZNw0rj33YZ+WCGC
 SU1t4VUWXbKbN3jYKPQvmZfOd9n8dlPrq9eUn86D1ZCWlStB/KQSz1HZ5eIRcn5TvRMr
 FkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qbR0azSstYv0bM0YwB+7IFgxmLnd5oQnRM84XNbUsk4=;
 b=kWte0N3dT0XZ/SZ/UapiaEqvEUZsr5Gaha/2SLGYEvdPdrsBGRNl0vcAkMhrGMa+ac
 4xcj0VcGXPVwiE4fBGpR4YOyXQZ7cxw3gqTT3zMAl3yHnQ9yNSohSQzlX039NVBpT+w3
 5Vbz3OuDY6tbvaG+H6S32ALTDyWYOD1/UM/1vcq+kNhRtlnqF3Lt/hNAGAfP56y1bbu4
 mQBMIvHT3/1q8JaOxVvkm3Y8asf2qJJJqIzBK8uFSpN5U6KA9pzJv7c+TpJs4lfkKNlP
 IrtBhxaGUSUaipIvCW/32UgSUnj+22brs7aLTWuqHXbvZ/BbCyxTLCqY6bkIcfPR9Urb
 P5GA==
X-Gm-Message-State: AOAM530tmeMsZa9lkYb4lwCCxrUGkeWUtbCsG47ow5UrtQP1ADlSatSa
 WDCGp17WHKGqzawB0yxWlMkkxuX1X1i2L7tHYpNOLg==
X-Google-Smtp-Source: ABdhPJysq7C/8JUxjB7jMt+HBrl1Oh8mZEyj2Yr7LrWvL3t8psExSt4FBEjdnCxGEAQxF/b4KczAU5bq/zhyLdMaT1o=
X-Received: by 2002:a05:6512:3e15:: with SMTP id
 i21mr599844lfv.273.1631058203391; 
 Tue, 07 Sep 2021 16:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210907194931.1173750-1-osk@google.com>
 <CACPK8Xd-2FeUh3+yeJ7T87Vz8+A94TqiYO1Am0Tk=5nDLbeVQQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd-2FeUh3+yeJ7T87Vz8+A94TqiYO1Am0Tk=5nDLbeVQQ@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 7 Sep 2021 19:43:07 -0400
Message-ID: <CABoTLcQXJy+nX7G=AzMgJe2PxbNaS7H9_RwR3wGGGg7FMR8EXA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add TYAN S7106 BMC machine
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jason Hargis <jason.hargis@equuscs.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

RESEND - this time in plain text. Sorry for the noise.

Hey Joel

Thank you so much for the super fast review! So many things have
changed a bit since I worked on this DTS originally (years ago) -
thanks for pointing me to the updates! I'll make the changes as
recommended.

> > +&gpio {
> > +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/       "","","IDLED_N","","","","","",
> > +       /*B0-B7*/       "","","","","","","","",
> > +       /*C0-C7*/       "","","","","ID_BUTTON","POST_COMPLETE","","",
> > +       /*D0-D7*/       "","","PS_PWROK","PLTRST_N","","","","",
> > +       /*E0-E7*/       "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
> > +                                       "NMI_BUTTON","NMI_OUT","","HEARTBEAT_LED_N",
>
> We have a document that contains names for common BMC GPIOs:
>
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> Ideally your device tree would use them, but given this is an old
> platform then I understand if you want to maintain compatibility with
> existing userspace.

This is good to know! This is a "new" platform in the sense that we're
finally upstreaming (even if we have been running it for 2 years on an
older internal build). Also, this is going to be the basis for at
least one additional TYAN board, so I'd like to get it "as right as
possible" to avoid bad copy&paste. I was following the "standard"
names from x86-power-control
(https://github.com/openbmc/x86-power-control) so I had already
renamed some of TYAN's original net names. With that, I'd be happy to
rename all of the signals to follow the OpenBMC standard.

Some questions on that, given that there are a few signals that don't
have an obvious equivalent in the GPIO naming doc:

- Some LEDs and outputs are _N-ed, i.e. active low. Is there a good
way to indicate that? This is important, e.g. for "ALERT".

- There are some signals that are inputs but are not buttons, e.g.
"PLTRST_N". Also, this particular example is active low.

- There are a bunch of output signals that control muxes, e.g.
BMC_PE_SMB_EN_1_N. Is there a naming convention for those?

Does it make sense for each OpenBMC signal to also indicate the
original net name from the schematics. I realize that not many people
have access to that, but it would be good for those who do. I'd rather
document "too much" than too little.

Thanks
Oskar.

On Tue, Sep 7, 2021 at 6:33 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 7 Sept 2021 at 19:49, Oskar Senft <osk@google.com> wrote:
> >
> > The TYAN S7106 is a server platform with an ASPEED AST2500 BMC.
>
> Looks good Oskar. Some minor improvements suggested below.
>
> I'll pull this in to the openbmc tree once it's looking good, so
> there's no need to resend it separately in this case.
>
> Please do cc linux-arm-kernel@lists.infradead.org when submitting
> patches upstream.
>
> > Signed-off-by: Oskar Senft <osk@google.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 415 ++++++++++++++++++++
> >  1 file changed, 415 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
>
> You need to add this to arch/arm/boot/dts/Makefile so it is built.
>
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> > new file mode 100644
> > index 000000000000..292bfb1a4bb2
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> > @@ -0,0 +1,415 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +       model = "Tyan S7106 BMC";
> > +       compatible = "tyan,s7106-bmc", "aspeed,ast2500";
> > +
> > +       chosen {
> > +               stdout-path = &uart5;
> > +               bootargs = "console=ttyS4,115200 earlyprintk";
>
> s/earlyprintk/earlycon/
>
> See 239566b032f3 ("ARM: dts: aspeed: Set earlycon boot argument") for
> background.
>
> > +       };
> > +
> > +       memory@80000000 {
> > +               device_type = "memory";
> > +               reg = <0x80000000 0x20000000>;
> > +       };
> > +
> > +       reserved-memory {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               p2a_memory: region@987F0000 {
>
> I think we're standardising on lower case for hex numbers.
>
> > +                       no-map;
> > +                       reg = <0x987F0000 0x00010000>; /* 64KB */
> > +               };
> > +
> > +               vga_memory: framebuffer@9f000000 {
> > +                       no-map;
> > +                       reg = <0x9f000000 0x01000000>; /* 16M */
> > +               };
> > +
> > +               gfx_memory: framebuffer {
> > +                       size = <0x01000000>; /* 16M */
> > +                       alignment = <0x01000000>;
> > +                       compatible = "shared-dma-pool";
> > +                       reusable;
> > +               };
> > +       };
>
> > +&mac0 {
> > +       status = "okay";
> > +
> > +       use-ncsi;
> > +       no-hw-checksum;
>
> Are you sure you need no-hw-checksum?
>
> Back in the day we disabled it when using ncsi on the ast2400, as we
> thought it was broken when using NCSI. That was not the case:
>
>  commit 6aff0bf641cf69e487d7b46fc8be773d161f814d
>  Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>  Date:   Wed Apr 12 13:27:03 2017 +1000
>
>     ftgmac100: Disable HW checksum generation on AST2400, enable on others
>
>     We found out that HW checksum generation only works from AST2500
>     onward. This disables it on AST2400 and removes the "no-hw-checksum"
>     properties in the device-trees. The problem we had wasn't related
>     to NC-SI.
>
> I suggest dropping the property.
>
> > +
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_rmii1_default>;
> > +};
>
> > +&kcs1 {
> > +       status = "okay";
> > +       kcs_addr = <0xca8>;
>
> This style of kcs binding is deprecated. Instead we use this form:
>
>         aspeed,lpc-io-reg = <0xca8>;
>
> > +};
> > +
> > +&kcs3 {
> > +       status = "okay";
> > +       kcs_addr = <0xca2>;
> > +};
> > +
> > +&gfx {
> > +       status = "okay";
> > +       memory-region = <&gfx_memory>;
>
> This display device is for when the BMC is running to display it's own content.
>
> If the system is only showing the output from the host, then you don't
> need this enabled.
>
> > +};
> > +
> > +&gpio {
> > +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/       "","","IDLED_N","","","","","",
> > +       /*B0-B7*/       "","","","","","","","",
> > +       /*C0-C7*/       "","","","","ID_BUTTON","POST_COMPLETE","","",
> > +       /*D0-D7*/       "","","PS_PWROK","PLTRST_N","","","","",
> > +       /*E0-E7*/       "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
> > +                                       "NMI_BUTTON","NMI_OUT","","HEARTBEAT_LED_N",
>
> We have a document that contains names for common BMC GPIOs:
>
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> Ideally your device tree would use them, but given this is an old
> platform then I understand if you want to maintain compatibility with
> existing userspace.
>
> > +       /*F0-F7*/       "","CLEAR_CMOS_N","","","IPMI_ALERT_LED_N","","","",
> > +       /*G0-G7*/       "BMC_PE_SMB_EN_1_N","BMC_PE_SMB_EN_2_N","","","","","","",
> > +       /*H0-H7*/       "","","","","","","","",
> > +       /*I0-I7*/       "","","","","","","","",
> > +       /*J0-J7*/       "","","","","","","","",
> > +       /*K0-K7*/       "","","","","","","","",
> > +       /*L0-L7*/       "","","","","","","","",
> > +       /*M0-M7*/       "","","","","","","","",
> > +       /*N0-N7*/       "","","","","","","","",
> > +       /*O0-O7*/       "","","","","","","","",
> > +       /*P0-P7*/       "","","","","","","","",
> > +       /*Q0-Q7*/       "","","","","BMC_PE_SMB_SW_BIT0","BMC_PE_SMB_SW_BIT1","","",
> > +       /*R0-R7*/       "","","","","","","","",
> > +       /*S0-S7*/       "","","","","","","","",
> > +       /*T0-T7*/       "","","","","","","","",
> > +       /*U0-U7*/       "","","","","","","","",
> > +       /*V0-V7*/       "","","","","","","","",
> > +       /*W0-W7*/       "","","","","","","","",
> > +       /*X0-X7*/       "","","","","","","","",
> > +       /*Y0-Y7*/       "","","","","","","","",
> > +       /*Z0-Z7*/   "","","","","","","","",
> > +       /*AA0-AA7*/     "","","","BMC_SMB3_PCH_IE_SML3_EN","","","","",
> > +       /*AB0-AB7*/     "","","","","","","","";
> > +};
> > --
> > 2.33.0.309.g3052b89438-goog
> >
