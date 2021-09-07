Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5AB403119
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 00:33:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H40RD5mclz2yJQ
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 08:33:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z+27OnC3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z+27OnC3; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H40R62YZ6z2xXn
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Sep 2021 08:33:21 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id w9so80881qvs.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Sep 2021 15:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0G6XtIwi8quS6hf5B1jRiOFQTTZ+TgD3Zci6j0M7Ns=;
 b=Z+27OnC3AqvOve4VWKX7DXEVhh5hQg33gwJgb3muQMEsJClL3gB0OsaC7yW8XvoNjG
 Im8Ftk/9HIz3TQE10gTnRbqMzYnq7StmJaXyAqii++NTNzbGuZAdBPaOvBKjeKi+VXZz
 YASErvAhnkZMScgkkaMN6qojeNC2dg79nmXRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0G6XtIwi8quS6hf5B1jRiOFQTTZ+TgD3Zci6j0M7Ns=;
 b=EiyeWaR4E+fw0GkUzz23rn8T/Ag0qBm0m5BKuQi4zB5ckHtnrv1NiK/99krRyfV8w4
 w6z6C7uwXbwKxVIKj4EhNQXxThkPyy5erqheE3Vryie/ufFDh82VwI3fD8Sxv4YhGwsg
 n/rcglC8Kb1Jq99yI/HQPqq0oSq5Zs/E7bdArBKxW+arsqGHnOI0tSXssk8Migvj4J1n
 ETF65gAj3v5J73N4ANxMVUbRA+6Uq2JMPCFV1Li1iKRUzzjgGJqQjanLxBi7e65dH5aQ
 QEWMY5ARArtzGK9Tr42NbQLIKHQZNgJ1ymyFGaZAwLlAq1vFIjeBocm9ju28ifncjzal
 4IGw==
X-Gm-Message-State: AOAM532J1YB+4sSkyX38Wlo4UYqkMqS9KjcTneFx/V9xGSFbJ9XSbFrh
 GNmnaAFr8d7/YdfPeEjv3HqUopAQlJfbU3zKZVA=
X-Google-Smtp-Source: ABdhPJzpAMhsdvJ0yoGUAQRNTHj7sc2mi6sUd6eqovHT59mxRNFeVKXodNL0Is/e4+dmCPnCEn15whjOv2xhn7BQVyg=
X-Received: by 2002:ad4:5cc2:: with SMTP id iu2mr421955qvb.41.1631053997650;
 Tue, 07 Sep 2021 15:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210907194931.1173750-1-osk@google.com>
In-Reply-To: <20210907194931.1173750-1-osk@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Sep 2021 22:33:05 +0000
Message-ID: <CACPK8Xd-2FeUh3+yeJ7T87Vz8+A94TqiYO1Am0Tk=5nDLbeVQQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add TYAN S7106 BMC machine
To: Oskar Senft <osk@google.com>
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

On Tue, 7 Sept 2021 at 19:49, Oskar Senft <osk@google.com> wrote:
>
> The TYAN S7106 is a server platform with an ASPEED AST2500 BMC.

Looks good Oskar. Some minor improvements suggested below.

I'll pull this in to the openbmc tree once it's looking good, so
there's no need to resend it separately in this case.

Please do cc linux-arm-kernel@lists.infradead.org when submitting
patches upstream.

> Signed-off-by: Oskar Senft <osk@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 415 ++++++++++++++++++++
>  1 file changed, 415 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

You need to add this to arch/arm/boot/dts/Makefile so it is built.

> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> new file mode 100644
> index 000000000000..292bfb1a4bb2
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -0,0 +1,415 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Tyan S7106 BMC";
> +       compatible = "tyan,s7106-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";

s/earlyprintk/earlycon/

See 239566b032f3 ("ARM: dts: aspeed: Set earlycon boot argument") for
background.

> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               p2a_memory: region@987F0000 {

I think we're standardising on lower case for hex numbers.

> +                       no-map;
> +                       reg = <0x987F0000 0x00010000>; /* 64KB */
> +               };
> +
> +               vga_memory: framebuffer@9f000000 {
> +                       no-map;
> +                       reg = <0x9f000000 0x01000000>; /* 16M */
> +               };
> +
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>; /* 16M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };

> +&mac0 {
> +       status = "okay";
> +
> +       use-ncsi;
> +       no-hw-checksum;

Are you sure you need no-hw-checksum?

Back in the day we disabled it when using ncsi on the ast2400, as we
thought it was broken when using NCSI. That was not the case:

 commit 6aff0bf641cf69e487d7b46fc8be773d161f814d
 Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
 Date:   Wed Apr 12 13:27:03 2017 +1000

    ftgmac100: Disable HW checksum generation on AST2400, enable on others

    We found out that HW checksum generation only works from AST2500
    onward. This disables it on AST2400 and removes the "no-hw-checksum"
    properties in the device-trees. The problem we had wasn't related
    to NC-SI.

I suggest dropping the property.

> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +};

> +&kcs1 {
> +       status = "okay";
> +       kcs_addr = <0xca8>;

This style of kcs binding is deprecated. Instead we use this form:

        aspeed,lpc-io-reg = <0xca8>;

> +};
> +
> +&kcs3 {
> +       status = "okay";
> +       kcs_addr = <0xca2>;
> +};
> +
> +&gfx {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;

This display device is for when the BMC is running to display it's own content.

If the system is only showing the output from the host, then you don't
need this enabled.

> +};
> +
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "","","IDLED_N","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "","","","","ID_BUTTON","POST_COMPLETE","","",
> +       /*D0-D7*/       "","","PS_PWROK","PLTRST_N","","","","",
> +       /*E0-E7*/       "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
> +                                       "NMI_BUTTON","NMI_OUT","","HEARTBEAT_LED_N",

We have a document that contains names for common BMC GPIOs:

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

Ideally your device tree would use them, but given this is an old
platform then I understand if you want to maintain compatibility with
existing userspace.

> +       /*F0-F7*/       "","CLEAR_CMOS_N","","","IPMI_ALERT_LED_N","","","",
> +       /*G0-G7*/       "BMC_PE_SMB_EN_1_N","BMC_PE_SMB_EN_2_N","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","BMC_PE_SMB_SW_BIT0","BMC_PE_SMB_SW_BIT1","","",
> +       /*R0-R7*/       "","","","","","","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/   "","","","","","","","",
> +       /*AA0-AA7*/     "","","","BMC_SMB3_PCH_IE_SML3_EN","","","","",
> +       /*AB0-AB7*/     "","","","","","","","";
> +};
> --
> 2.33.0.309.g3052b89438-goog
>
