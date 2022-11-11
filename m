Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA47E625344
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Nov 2022 06:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7p0v4vfkz3cNb
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Nov 2022 16:58:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Udqr2R8V;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Udqr2R8V;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7p0m3zyBz2xB1
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Nov 2022 16:58:32 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id g12so5116152wrs.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Nov 2022 21:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dQTrN1j7D5Od0RfI0QG9Fx5v8zmQsi9NEHZ+3EDUSmk=;
        b=Udqr2R8V2vNlq/sUqkbHvF99eYazAH/Ki28lYHT/G1nHEvnKkXmEK2VuFCBklfjWkf
         3Bo4PmakcOB+8PWupzC2xT07UlatAy62NcnCjTseUoPltjv1JnLr7YMNIxEfWa0IvoIS
         Rsbs1oj0nKU6W1qF64Yh3P4Rb8YBiydAsqXPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQTrN1j7D5Od0RfI0QG9Fx5v8zmQsi9NEHZ+3EDUSmk=;
        b=Dnz4ZFInUGuU685TRuXNhktEx9/i5D/8EhDfMp7DvFvUuEickViPcpPqcdjY2dY1Sw
         GMmdBCfay55JT6xNh6Wh91XEwpHEWcsaI0cogzOpCevlks1TRkkdbNDJJ9p3ZjgiER3m
         cnotoGh+uO3oB7oXwMHHGxi4euXZi+O2ww9t9mbsPWR/jpH+Kc/OveJjEUI1Bzr64PMB
         Yvxl4cIAvNggnjspD1rFVMCN9qbFRYVfZGa1c3LkMGhY7Z9qc5+3s2/q8DR10EhO7h9V
         UcHh2sZgS9WCZ6hbZ6TJqYA0+x+myA8rVaLXqW/tEdqIRRDZkIikR5aE8ub1RgX8CHoQ
         itQw==
X-Gm-Message-State: ANoB5pmeROfnqX/OBtMBF3ljjF8xknWTEOop1lL7+2uw9zYXT/sRpLDs
	7cmb1daCghDb3wNubAQJsF+lcTLtkdY6lPDa/HA=
X-Google-Smtp-Source: AA0mqf7ddsHaE9m3bziST+k+8FnQ49rwnt7qQpt3yMJefxJD01k/U73boNvBT/FrsyenllusOjqxghFE6ABOF16G7Vg=
X-Received: by 2002:adf:f10b:0:b0:236:4983:285a with SMTP id
 r11-20020adff10b000000b002364983285amr235372wro.606.1668146308386; Thu, 10
 Nov 2022 21:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20221110013438.16212-1-zev@bewilderbeest.net>
In-Reply-To: <20221110013438.16212-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Nov 2022 05:58:16 +0000
Message-ID: <CACPK8XdkXaVXzabFM-g6xQ1CBjZheiP9oFrYk5o1__QR7WBcdw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update git tree URL
To: Zev Weiss <zev@bewilderbeest.net>, Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Nov 2022 at 01:34, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> The description for joel/aspeed.git on git.kernel.org currently says:
>
>     Old Aspeed tree. Please see joel/bmc.git
>
> Let's update MAINTAINERS accordingly.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Thanks!

Acked-by: Joel Stanley <joel@jms.id.au>

Arnd, does the soc team have a branch for these?

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cac5a4ad4eb8..1775e5fdaefd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1969,7 +1969,7 @@ L:        linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
>  Q:     https://patchwork.ozlabs.org/project/linux-aspeed/list/
> -T:     git git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
>  F:     Documentation/devicetree/bindings/arm/aspeed/
>  F:     arch/arm/boot/dts/aspeed-*
>  F:     arch/arm/mach-aspeed/
> --
> 2.38.1
>
