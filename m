Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37F2587BD
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 08:00:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgbz81JYfzDqSq
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 16:00:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=I1Cl2FDV; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgbyv3QWlzDqSd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Sep 2020 16:00:39 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id n22so250464edt.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Aug 2020 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YG5VVLnr0PW/yZAIIXvrmgCG3qrxXpxZ6xJoDnhxDp8=;
 b=I1Cl2FDVaVvaOSOfgtQ92iqMB0672fG0G4xJKICPc4tAG3bPNWYmcZAC48HM3JiKyd
 oLAnsx6Z8+CW7CjXdqggMfMDaXGZAQAwAWOkEvYOqmABVzvNjcS1+g/1nsPV2qsJsaGX
 3dTTEn2MWKQZ2EcnCx6rB+dHrADKNuYQwfz+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YG5VVLnr0PW/yZAIIXvrmgCG3qrxXpxZ6xJoDnhxDp8=;
 b=KUXAJRCg6ZuvuaXlvgwy1ZQEXdK7eIh+bYcO0kCUeGn94l9eqieG5bVo/mi77NBtuU
 bQ3iWGwFH9wJf+OF8WDoAYa+RH9oUxnzKqNi8S3qQFRDcNY7W2JLu840H8piqLzt99xS
 oShm6lK75/Edtd9++DbEN11v6JrLVa23fEvRB0Zb2JSsNq/tcjmXDUZNAoUlDDMyA7In
 Rmh2A+V0Xx2/KXzX9xMBuz1Uws+spmJ37wVwb/zUEzHJwhGrqX5VRrBjyceFWcOLhGjJ
 ESYLT2cN5eeLa9bTGSrgAX3cnPHRP1UfP9qTNyzi1Ut1jTp8m41VQU7FHesdQfcepco2
 /hbQ==
X-Gm-Message-State: AOAM5318BLOmNm5HPV460g6+EgWi2pxSMmQqjZp5myhATlosHBZiN93u
 1+/VquHuI1ONrIksMMxtcpiksqWLsTNpxD8uQjA=
X-Google-Smtp-Source: ABdhPJz9eU3v8XlDwZfFwqePNcy+jcI0AiJOMWa794CyKfXIs0MDCh9UQDA9Ak+JcJYKcyUTgG+a6ltohowcflXsO3A=
X-Received: by 2002:a50:f403:: with SMTP id r3mr348556edm.260.1598940036519;
 Mon, 31 Aug 2020 23:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-5-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:00:24 +0000
Message-ID: <CACPK8XfeKiee-LAQZXs6jygr1Bj7pqGTGLUnTV1mzO5FBZ-XZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel I2C
 device
To: Eddie James <eajames@linux.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, dmitry.torokhov@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set I2C bus 0 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 5f4ee67ac787..9cf2e02ae9e2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -438,7 +438,13 @@ aliases {
>  };
>
>  &i2c0 {
> +       multi-master;
>         status = "okay";
> +
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */

Other users of SLAVE_ADDRESS have included <dt-bindings/i2c/i2c.h> and
written the reg as follows:

reg = <(I2C_OWN_SLAVE_ADDRESS | 0x62)>

Which obviously has the same result. I'll leave it up to you.

Cheers,

Joel

> +       };
>  };
>
>  &i2c1 {
> --
> 2.26.2
>
