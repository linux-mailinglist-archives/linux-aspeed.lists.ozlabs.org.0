Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E07172D223C
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 05:48:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqnjt5ysqzDqZ3
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 15:48:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=M4ETzUHq; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cqnjp54yBzDqCb
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 15:47:56 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id f14so2673716qto.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Dec 2020 20:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gr6ueobMh+vnmyt2bfamggoZ4Oj0RVzF8cBiEWbccuM=;
 b=M4ETzUHqiw2eaTNSI9rZ+u8o2w+3aoosIwYtTxO9c7WrK1T/cFwFlHnelv5cZm225K
 6U+jTJ9waGexRwSBEX/SQJJxuk01rr2tRrX1X1QuQewX8rmCfyf+lXLPKYi5xZd+GuMO
 vaBV8HlczfHnchnB7n7Ev4kqCJ5lC2UfCLj6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gr6ueobMh+vnmyt2bfamggoZ4Oj0RVzF8cBiEWbccuM=;
 b=oS28+0zScHhgnUXRvriw5No3hSs2ap7C1cOJqhIMQJTmo7zGmhyc6ebbL/snjuBC66
 ywYw6hoZiQCnHe5n+pbPgQfJzPfSrq89VJHts/rntGXTItaffw1kS0fTsDlVbn8zIXKz
 1Ebn+UK0LL7VoE0vKWZZRJsJIjnOCSswonwNbg8+tgo9R2cQ/66+9x8qtxEFWWwWTqO2
 /N2OkgxrfbduI3VvjwbSMHCEcmFSQRJsAtuCKnm7QZQc+CLZwJBha/BUXgYA/V+DmaXL
 VKda7rj7vL5oSqybrCzP12KR+dtJQVIQuEF3nr9S6I6wdsdMZiMQ6MOKAN924VXCojQG
 MLjQ==
X-Gm-Message-State: AOAM533ibhw9fRowzgQ5StJIxRkb1rnE+29oagnqneED6SMd/xmCD9yB
 306iafuvYq4hdwKCaMrqgzLbAluinZp5ZHlRCqY=
X-Google-Smtp-Source: ABdhPJyyLcbrhQrxezdnGCGZdOwsDBSb8fGGduYb0qreiYG4sPtDKFBaIlNbf3rbOUR87HODmd1ZbBjHuVrb2J3mZLo=
X-Received: by 2002:ac8:5cce:: with SMTP id s14mr27174884qta.135.1607402874438; 
 Mon, 07 Dec 2020 20:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20201208012615.2717412-1-andrew@aj.id.au>
 <20201208012615.2717412-7-andrew@aj.id.au>
In-Reply-To: <20201208012615.2717412-7-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Dec 2020 04:47:41 +0000
Message-ID: <CACPK8Xfx8gtJWncrnyXyqBwzce4pyT21RbA4JzM7GSp_yPsNKA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] ARM: dts: rainier: Add eMMC clock phase
 compensation
To: Andrew Jeffery <andrew@aj.id.au>
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
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 at 01:26, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Determined by scope measurements at speed.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

... assuming the bindings get acked.


> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 21ae880c7530..ab8d37d49f30 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -186,6 +186,7 @@ &pinctrl_emmc_default {
>
>  &emmc {
>         status = "okay";
> +       clk-phase-mmc-hs200 = <180>, <180>;
>  };
>
>  &fsim0 {
> --
> 2.27.0
>
