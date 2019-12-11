Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733911A678
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 10:08:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xrgg10RXzDqZP
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 20:08:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="S60wH1RH"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XrgX59qKzDqBv
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 20:08:02 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id c17so9097219qkg.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 01:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+1+2OzonF8JaI5zb2TCQGTWjY1hWFqWalCfMdztL7bw=;
 b=S60wH1RHuXQ8mOnPL0RhPKzQIGXltV0Cv9h00AH+VYro56n5frUBSr4jG3994daVvT
 V+vThx0M+M5TKEPRP7rKgYkWR9SLOxLfctebgbS4/teJyPdNqlqYK9Sqae4OYe3pOZfj
 RbOKuXYBl+rwcuW9scJiI3DZUILjSRdRChb2cUjEMEG/J6gALdSSdCrSN73Zs+Oaq7Ld
 ncsVZLJRCCbXDi37Bkc0aQABg2eiqLVtoela5xrLAMI6eSLhlktSHK/xO5UF2xLQLYer
 yMxhiSsTvhVSoG04ZT4mwPZHx/2a+Y7mdi6v2EwwgKDOC/A2904us+0B2fJX/ZY9l4Bm
 hO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+1+2OzonF8JaI5zb2TCQGTWjY1hWFqWalCfMdztL7bw=;
 b=o8GmqxXs6fvH3nSzDNY6uuZmcTNy8g64wFAtYbuy9Wrxud8HFdMkXr60TXr8GKs8lq
 oVOvGEtH/QQmzfL3L30wNgcTG47ZY4+/sD0vfndGlaTVvjK/bHDSQog4QdZGjSNoaxSK
 8jJSU4nAX8qCxZUHWQulbasD7reYaBOrJfksrQaSdZtOz6w5CBBZe5Ws8ucZ7HQd1xLq
 c1t3BMqodpMULshKw/Zo7czNBWMJLgwRdwjlfwGY31NrsugjZTvfhu40GLkKyXPndroK
 9ixaw+DQoGIKlq2KmGyzQwNEtXBxfq3wxNSnQUsE6ypIwJQyk3IIhg3qYBaaSWhqOUUV
 8nAw==
X-Gm-Message-State: APjAAAUye4s4vCcOlzCsN6vS4PpqpIgm9nKtL2CnybeGhtPQZTBcjbBi
 z/IjRHGyzxS8Dkk3vyKLlHAQjEBpL76tzry7A8zEgQ==
X-Google-Smtp-Source: APXvYqxo51nvYaIkggIMq8ITtXp9gbKNulM8Wmtc5DRGjuFLLqvLJhg/1ssY8su+0/x7Vipo/ClbnBGeVsB5uoQ3mKs=
X-Received: by 2002:a37:6255:: with SMTP id w82mr1919216qkb.330.1576055278589; 
 Wed, 11 Dec 2019 01:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20191210202842.2546758-1-arnd@arndb.de>
 <f6a514d1-44cb-4577-af07-fd2f3fefc974@www.fastmail.com>
In-Reply-To: <f6a514d1-44cb-4577-af07-fd2f3fefc974@www.fastmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 11 Dec 2019 10:07:47 +0100
Message-ID: <CAMpxmJUD8A1qtmZmOxAq3XojFG5LHu_DS94LC7orinz_O9zY=A@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: avoid return type warning
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, Hongwei Zhang <hongweiz@ami.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

wt., 10 gru 2019 o 23:10 Andrew Jeffery <andrew@aj.id.au> napisa=C5=82(a):
>
>
>
> On Wed, 11 Dec 2019, at 06:58, Arnd Bergmann wrote:
> > gcc has a hard time tracking whether BUG_ON(1) ends
> > execution or not:
> >
> > drivers/gpio/gpio-aspeed-sgpio.c: In function 'bank_reg':
> > drivers/gpio/gpio-aspeed-sgpio.c:112:1: error: control reaches end of
> > non-void function [-Werror=3Dreturn-type]
> >
> > Use the simpler BUG() that gcc knows cannot continue.
> >
> > Fixes: f8b410e3695a ("gpio: aspeed-sgpio: Rename and add Kconfig/Makefi=
le")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Applied for fixes.

Bartosz
