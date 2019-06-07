Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA4D39893
	for <lists+linux-aspeed@lfdr.de>; Sat,  8 Jun 2019 00:23:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LH9n2GM9zDr2d
	for <lists+linux-aspeed@lfdr.de>; Sat,  8 Jun 2019 08:23:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="b6Uttyul"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LH9g5dqzzDqRt
 for <linux-aspeed@lists.ozlabs.org>; Sat,  8 Jun 2019 08:23:34 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id o13so3027282lji.5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 07 Jun 2019 15:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mKQ/jkVDmHzG3Imk3QoYm7ZRsrxgpBXEW32JYoXBK6c=;
 b=b6Uttyul57zhK0WLRFY2uElrt+7RjU0A4CqB86e19BlOPEOButGb8d+RfNG8TmtLB/
 hBYKaq1+NEQfc2TXYpAX9tB+2jG8DNuaZf5sdL85L4+yBSSqlQ0j0efAavrSbhlJ8QM9
 dnMVqvx3u5kJJXi+BuQLcqU3D1MwwvOPoW0lo6mYfxYoE5VsfLGSZSc0/bMEdRBNrPHz
 q99sHZs3QMahC9tKZJMU6C40PoGzO75S325tIkzoa6Ewy2EOI1HUtO2aG6v6ukATbBGP
 PgIbNsEzUVwnw8k8NofrSWHlXcShNIz6Rp8GGnv+pA+JAaq3n0yRBc5FXY92rMC7E6lW
 iOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKQ/jkVDmHzG3Imk3QoYm7ZRsrxgpBXEW32JYoXBK6c=;
 b=cZ3dz5SklL5JwC8w1Ob9LQvjv4HBAuv1qPYqQ63OvcoJuzjiuFgEKFt3jUZqBKGlQd
 otgjkvZwp3kZEoyCD/MJSXYakugIFmDrTncKjO7vHfaCdIZjul1XZnB6Dld/NBgVvx3k
 oB9zKMLfi0+0oP1/HYrghGtFPS7N+i9CWPdxmPxwysj8E/8NnWXeljrhO5rPsIzqRX0f
 AnHxTgqdlp+xQp2CAiNa1+4+Lp9sKfuv/q5cYWlUj3FWfGA7/qA/2bpSv0IxzAFoWpfc
 8FcfTAHH12FKiHCf1vax64J3uG9MEGkhcJAccVUp95G6W9QIMw2jFs25v+M16q5ZlsSS
 2JlA==
X-Gm-Message-State: APjAAAWF0SMl5SpdatkOdTINGtQazISGlmoEE1RhbkFiN5+pmi7D2Pxt
 hA9kyJqudkrLpM6MAjtE0UE45Gezzb5IvuJgBUxkIg==
X-Google-Smtp-Source: APXvYqwB2qJJmkpZg21BBIfS3DEIvPDBmZVSisAyl2+8KE4YGuHY6alNrysBJaP17ZsV+0U5Xx/P5PNamh/WkwZKcrM=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr23337666ljk.104.1559946209241; 
 Fri, 07 Jun 2019 15:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <1559685212-15857-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1559685212-15857-1-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 8 Jun 2019 00:23:21 +0200
Message-ID: <CACRpkdb=NBkqG1qi6F66pcd7UaxmpT9LFVLaCLFrM2SXDihJng@mail.gmail.com>
Subject: Re: [PATCH 1/3 linux dev-5.1 v2] ARM: dts: aspeed: Add SGPM pinmux
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
 <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 11:53 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
> supporting SGPIO in AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

Patch applied! I altered the subject a bit to match the change
to the pinctrl subsystem.

Yours,
Linus Walleij
