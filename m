Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E12B3CDC
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 07:14:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJgb0KdFzDqLf
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 17:14:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LIAjCCtE; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJgR11XlzDqLd
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Nov 2020 17:14:11 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id q5so15890297qkc.12
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Nov 2020 22:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IDPJ0hDw+QMwCbfwtU5/cMb2P1q7+XVEepopxSFVZUs=;
 b=LIAjCCtES8iorpgDK8RHzG6KjduEl/e8zhzt4tgqBASno5xJZW0/djcO9cASFpH+mJ
 dgL05YZqem99cky+4AO2DPQM1zcCOAUxgCz9FrW+exIInR+ri8fY1jdfEM9vwu2zA7Kl
 rfsq/xeaeXJNUsxjjbXktvFxcH+asPevYgjm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IDPJ0hDw+QMwCbfwtU5/cMb2P1q7+XVEepopxSFVZUs=;
 b=eHA35DNDXQjdguZDPCRkvTaFuv3Zb2WHOuEEShM6j4OsbrQgEJCyBz7OWQhaKemxMq
 pFhQvz06Sa4D2fw2XpOp3NnXc6H0JkH0645DkGBGtElOaLxVd+PjWDumKoWLpeAXXkSq
 /ia0ruFP61RMrVGRUDbln/vK4l6vmL5YObSKVmm1y5bkOfe8zBt7sof4F2wX1De2an0w
 yIW2gDkKE70yLPGjEWlpC0vCIAXXU9xHcjcl3zXKnKzh7rru9icDfnzcZIIgqWaeqKrF
 5hI/YnvNoxOCoGCOrKNzWe5de5nXbe8B/X2/b2NlNZGu+2KIOw2gTu8LWIavUXfsVs+l
 hQLA==
X-Gm-Message-State: AOAM532rJgbrB7F55TAcfA5p8ilrbW5mbZuLtHPUJQej0pvdH+4NVdT3
 gKNLChuErVzsKT5pDAFT1lPEzCIGsRJybwTW6dw=
X-Google-Smtp-Source: ABdhPJxw7qMo/XDHcMm/miSXAx0lXi/G21woSkTc5vH/0ZtFtSLckMuKiGz0zTyOqc9/RWNIykC/VLeyTLfqiqs7U9A=
X-Received: by 2002:a37:664d:: with SMTP id a74mr12974651qkc.487.1605507247059; 
 Sun, 15 Nov 2020 22:14:07 -0800 (PST)
MIME-Version: 1.0
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-2-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1605247168-1028-2-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 06:13:54 +0000
Message-ID: <CACPK8XfRS7jMmqeDFvzjA-K2-zMr-hu8msdrXsZ0K4H8F670Mw@mail.gmail.com>
Subject: Re: [PATCH 2/6] ARM: dts: aspeed: rainier: Add directly controlled
 LEDs
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 13 Nov 2020 at 05:59, Vishwanatha Subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
> These LEDs are directly connected to the BMC's GPIO bank.
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 64d8748..1da7389 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -126,6 +126,26 @@
>         leds {
>                 compatible = "gpio-leds";
>
> +               /* BMC Card fault LED at the back */
> +               bmc-ingraham0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure ID LED at the back */
> +               rear-enc-id0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure fault LED at the back */
> +               rear-enc-fault0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* PCIE slot power LED */
> +               pcieslot-power {
> +                       gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
>                 /* System ID LED that is at front on Op Panel */
>                 front-sys-id0 {
>                         retain-state-shutdown;
> @@ -169,7 +189,7 @@
>         /*E0-E7*/       "","","","","","","","",
>         /*F0-F7*/       "","","","","","","","",
>         /*G0-G7*/       "","","","","","","","",
> -       /*H0-H7*/       "","","","","","","","",
> +       /*H0-H7*/       "","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
>         /*I0-I7*/       "","","","","","","","",
>         /*J0-J7*/       "","","","","","","","",
>         /*K0-K7*/       "","","","","","","","",
> @@ -177,7 +197,7 @@
>         /*M0-M7*/       "","","","","","","","",
>         /*N0-N7*/       "","","","","","","","",
>         /*O0-O7*/       "","","","usb-power","","","","",
> -       /*P0-P7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","pcieslot-power","","","",
>         /*Q0-Q7*/       "cfam-reset","","","","","","","",
>         /*R0-R7*/       "","","","","","","","",
>         /*S0-S7*/       "presence-ps0","presence-ps1","presence-ps2","presence-ps3",
> --
> 1.8.3.1
>
