Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8634285E1C
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 13:28:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5sXG1Y0MzDqJq
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 22:28:14 +1100 (AEDT)
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
 header.s=google header.b=c/ECYqqt; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5sX35nwxzDqCc
 for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Oct 2020 22:27:59 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id d20so2214822qka.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Oct 2020 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CHSgzvUJzj+APwFwvwmmcNiA4VcGl2fPcumULSWSX8E=;
 b=c/ECYqqttNUHkb/rdwaudk7Ge5bDGTkXWp+GuaXmR5nf2B1B7OR04YMDqmQQUcZrml
 kyC8FbP0vVlCgoIrJmAxt6crEpI+f4zYVvEiIGAAPzn1eGkoZ7ESi/YLMUFBRpPjv+Hu
 B+7EnimfWa4SIazl2fO5wUAkMWh4e2twcqfzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHSgzvUJzj+APwFwvwmmcNiA4VcGl2fPcumULSWSX8E=;
 b=aoozl46UzXmuUr//bh5Y7iAydW6cntTWWB1dGIlZzP+56vzeGWW6MNwX7xSnkYDhar
 0mUa/ZqDkgq3tJhvQ/Xkmw9nkkIYWL/FKpdXGO7yOA2EWzVfOAqxoDK6n/pSlU03JBVH
 DgLqcFMYBGHuC/PmBCQs+RLIydabw28ZYdvHrX1hqLp8apJ9g9E7TZjTQWvciqOOdQKm
 GFyA8BvRmv+WRCY0mTye6fddTWNltMPsleNPegP0A7qGfb718VPN7ZFWRzJQDPBlyCvM
 Sma6gOHfDzeGf5DyHaZ8dtob3YQNo9kspPAzJEzupOvgfs9BNsRBtIbj88T0eCkVVr4L
 b78w==
X-Gm-Message-State: AOAM530wbFcuIFc2vDxiKUHW+weRDyKjkpcZACnhxcbUK2xvKDkclwhT
 WsJg1IO145UZggECM8rhpgOqZr9Hx0LMhKnTTUI=
X-Google-Smtp-Source: ABdhPJygdE+BClw6ls4Og5yZ5qX4nBMePZyf8d4tQiZAmni7tHPrS48fCxUgkBF3nEu7mFLoy6cRw85nRlHoGhT68vU=
X-Received: by 2002:a37:2c06:: with SMTP id s6mr2271040qkh.55.1602070075400;
 Wed, 07 Oct 2020 04:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
 <20200930040823.26065-4-ryan_chen@aspeedtech.com>
In-Reply-To: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 11:27:43 +0000
Message-ID: <CACPK8XcmA49S4mJmkmoyTyJ=cWkgyXLrXC-mbWVSO0M_tZAZ1w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: add ehci uhci enable in evb dts
To: Ryan Chen <ryan_chen@aspeedtech.com>
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
Cc: bmc-sw@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 30 Sep 2020 at 04:08, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> Add EHCI UHCI enable build in aspeed-ast2600-evb.dts
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 89be13197780..2772796e215e 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -237,3 +237,11 @@
>  &fsim0 {
>         status = "okay";
>  };
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&uhci {
> +       status = "okay";
> +};
> --
> 2.17.1
>
