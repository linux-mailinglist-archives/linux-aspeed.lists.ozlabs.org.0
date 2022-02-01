Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C000A4A576F
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 08:02:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnwpf4Pk1z3bTn
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 18:02:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=eH3LIHHN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eH3LIHHN; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnwpZ3dBnz2x9J
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Feb 2022 18:01:57 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id z1so12502433qto.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Jan 2022 23:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ofUNs4jZW+VJID8NdJTfJEAl1tXnq8A5FUYSEBgME9I=;
 b=eH3LIHHNXyCf9RgmKlCVQNG1NZjleLL6UXaZM2DzFFaIcOXUZmwDm73n6ljHAV2mBN
 1rEqBBpUdZtVpujfifb5v0L+7HoayDiguh5nRlAlvs9e4SkmENBsLeiq+E0LHfaAHtvT
 cLRCPOoC5oHL87jpqlMxqVK+RPOdCDuqGFA5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofUNs4jZW+VJID8NdJTfJEAl1tXnq8A5FUYSEBgME9I=;
 b=HwtDftJiJTZ16aWOatJj7xbOSXxCKdHfaC7RNtdeYRxHGF7EsnrM5agqvsCkqnkJBG
 TI8ijVhKnSXlcQ0exakuQgwQMt/ivcikF/gDma5QsZsgFyADXcCd9Lnuf/GRhpsAAgtd
 bM3T61liT4jY8EqCU3jRVj/+rqaqJsfx3ORWAspDOb+2xenJzSL86iqnKH+cj8WvP00u
 hFOaYSGQWLuMJ/51KjrUE1t5oxWqqIwXVI2KyA4NMZ9/bIhpdbCSYnN5blEzdGgtWFny
 TnSV9kyAuXP+Beld8T7DwvOpSblcBptUtNCgtmuzr8oHrqtYtip4FQQnz6A7KhKqv1Ua
 mMig==
X-Gm-Message-State: AOAM532Sk/KipKzsQS7+QrxYHGjwSSraKme+FqBSXH+E2+6y7aXI/hZx
 +DORDELXUYvv2U1tKek70F5Sw4bT2Hf5RfMj5vY=
X-Google-Smtp-Source: ABdhPJzex+T5jB7qh9KAiV5zVNlmmATGRAqu8eaMn8IYJzIjb+7Kt6wQrTHUZuYMeznBLseY5I8oIHuiuQNef/XZOa0=
X-Received: by 2002:ac8:5a93:: with SMTP id c19mr18181843qtc.58.1643698913805; 
 Mon, 31 Jan 2022 23:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20220124014351.9121-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20220124014351.9121-1-chiawei_wang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Feb 2022 07:01:42 +0000
Message-ID: <CACPK8XfzBT3YiMYqH5cKX5jWSSYx45vNzubdUpXOTnE1xy2TXQ@mail.gmail.com>
Subject: Re: [PATCH next] docs/ABI: testing: aspeed-uart-routing: Escape
 asterisk
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 24 Jan 2022 at 01:44, Chia-Wei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Escape asterisk symbols to fix the following warning:
>
> "WARNING: Inline emphasis start-string without end-string"
>
> Fixes: c6807970c3bc ("soc: aspeed: Add UART routing support")
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

Thanks Chai-Wei, I've sent this to the soc maintainers to apply as a fix.

> ---
>  Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> index b363827da437..910df0e5815a 100644
> --- a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> +++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> @@ -1,4 +1,4 @@
> -What:          /sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
> +What:          /sys/bus/platform/drivers/aspeed-uart-routing/\*/uart\*
>  Date:          September 2021
>  Contact:       Oskar Senft <osk@google.com>
>                 Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> @@ -9,7 +9,7 @@ Description:    Selects the RX source of the UARTx device.
>                 depends on the selected file.
>
>                 e.g.
> -               cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> +               cat /sys/bus/platform/drivers/aspeed-uart-routing/\*.uart_routing/uart1
>                 [io1] io2 io3 io4 uart2 uart3 uart4 io6
>
>                 In this case, UART1 gets its input from IO1 (physical serial port 1).
> @@ -17,7 +17,7 @@ Description:  Selects the RX source of the UARTx device.
>  Users:         OpenBMC.  Proposed changes should be mailed to
>                 openbmc@lists.ozlabs.org
>
> -What:          /sys/bus/platform/drivers/aspeed-uart-routing/*/io*
> +What:          /sys/bus/platform/drivers/aspeed-uart-routing/\*/io\*
>  Date:          September 2021
>  Contact:       Oskar Senft <osk@google.com>
>                 Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> --
> 2.25.1
>
