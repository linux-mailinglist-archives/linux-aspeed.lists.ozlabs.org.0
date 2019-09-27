Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E2C049D
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2019 13:50:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fqqx5jqVzDqfP
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2019 21:50:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="dHkG+HnC"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fqqm2qRQzDqNm
 for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2019 21:50:42 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id w6so1707410lfl.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2019 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtkPzUdh0BjwnTFcU6cDEv31BuC4wG3MpqjO9vOb5nc=;
 b=dHkG+HnC9dM6qd1tsawE2B77CGjpChpBeEsSBUvLKNrVXpX+osBDmU/jLYHZPm1B/P
 2dyDxSkFmTP8ieUdkcZKpDi2kNeo10lBoWrXT9wdZ615R12K9KGFf6J/OrMdVyWQEX/z
 wYgpsuDlMp9FCPoF7j0EiuKNEMBtaw/LYAUt7RIkCAlVR/MANI5zfMMqmxqGDQcnXtAL
 2OY3vl+bQvPLR8uEP6OVKQm7w0g52y6Li38Svuxw5AE7QBLcb9eP1aPHP9bXfcFj5qG3
 0/jxw0iG4icNXkyuWt9atKmkl1Z8zGcUZmaUcKj8BAHOSFFYokiX4pBiyg/QJksov5nt
 4GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtkPzUdh0BjwnTFcU6cDEv31BuC4wG3MpqjO9vOb5nc=;
 b=FX2enr25mp9HfA0kuf8RMPZAUDMSHXk3Dd0tg8kDX037xuCSjmn+pCBht9w7FRrVtH
 oz7YFvwp5r1gcJAaqSUp8DFaJnMDtJEnsdkmh0go70KMj+EGzJ6D16YXok+5IONyUyMH
 MSQ/ajcjb+yZ6ywaaPhacIaerBQwysL/ZzE5XGrRfqUJfy2MlaHToHqpTDY4j3UUEIIP
 PKbnbIQOCLB7CU0AG99I2eP7DxSQT7Paviok/29T7moWNGGNpcjXTgUs+Jj35f9+zYW0
 kLVNCkjJk7Wlq0q7z8yASMmZSZiEH8gBu6LsUtdP//KdQEMHqA41ZNGm1cR7SLpbWrJx
 u8hA==
X-Gm-Message-State: APjAAAUWqNcBxewQUFjbtFYeKwhsitHlHV9yyWg20KruMwyshfBPrhLd
 xr3KU4/Bay4Bb/ET3N/rUNMcWXoGpU8QX75E8/yIsQ==
X-Google-Smtp-Source: APXvYqyF/AMU9HIQoJBR4mgMcIh/XR7QQxXA0oPACvNrMQJcYHLmYcQQw76chmDwmpMjtdY1kzoSIQzHJDEllWzZAzI=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr2493316lfa.141.1569585039656; 
 Fri, 27 Sep 2019 04:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <1569439337-10482-1-git-send-email-hongweiz@ami.com>
 <1569439337-10482-3-git-send-email-hongweiz@ami.com>
In-Reply-To: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Sep 2019 13:50:28 +0200
Message-ID: <CACRpkdY4RsqAOykyS-9GEFvF--3bmf=UjzADx8U18z=gTHBb4g@mail.gmail.com>
Subject: Re: [v2, 2/2] gpio: dts: aspeed: Add SGPIO driver
To: Hongwei Zhang <hongweiz@ami.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2019 at 9:22 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPIO driver support for Aspeed AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

I sent a separate patch to fix this up the way I want it with the file
named gpio-aspeed-sgpio.c and CONFIG_GPIO_ASPEED_SGPIO.

I don't want to mix up the namespaces of something Aspeed-generic
with the namespace of the GPIO subsystem. SGPIO is the name
of a specific Aspeed component.

Yours,
Linus Walleij
