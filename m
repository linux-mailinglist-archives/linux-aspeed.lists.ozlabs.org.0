Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE04768B4
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Dec 2021 04:29:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDyKG590kz3bvH
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Dec 2021 14:29:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TayLYKm7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TayLYKm7; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDyK9508Tz2ywd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Dec 2021 14:29:31 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id bk14so34577325oib.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Dec 2021 19:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UsxS3cyMXTSd/5dEUxUXWzl1BGIjNb+A41isAFW684A=;
 b=TayLYKm7gCeuqQb9cm8r765MqSSpedezKlCFG8xuhGLQYCwJNyYDVMEG9leDr0u6CY
 fkNvIOlP9Na/Th6qkKNnc6x+bvfn8C8lupqPK7GiP7KRjyScMKhpEBkWEtgt9hUCE6gg
 7vVOEtnJeGFR/LuffNb47ewKOslDxgwk+YJldC6AIh79XDjMjwwiQemDK8YgxOgxHDdd
 fLAQDncAJH78sXCzbh0lMRemUmr0p4Dd9BWnRgL4sP1dI+kj1vRzNknASF59iFIsZqOA
 PgmFJivdme8GXgdMRXa2x1h9Ju02hqMcTCmAKSikTGvGiB8SDQ6n6+TMkJQQJkvDg/GI
 TpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UsxS3cyMXTSd/5dEUxUXWzl1BGIjNb+A41isAFW684A=;
 b=5eNfSX3wEUbDIw5ZnFQFBMPwp8ubVaRvMPKenH5F61KAeGp338M5FG1oJTKdCX7zX2
 n16NPO8QbIcEqEEKfxn3SNNKdiJRHai0Y9imQFW65Ioy3XgMCbGZ8pEBd8oGdwwpZP0A
 ZUZVbWH0XndTFYVwN/+cN+F4kPlnknckBWfU81Sj+KBBk+gllH5yJ0QlmXaQoS9UBfyL
 ZAfGfJLjEdTQn+aOirCxZZTxtd0SADx/xi2jJvsXG4cs+Q2YlqozGjpM950xp4wJKIaP
 YgboPmNqqNIMgblbQq1V9+4Sr5ccaD/MOnf9cImlr7nqUnahITSZxCZXYyy9YSTPDoZs
 SKGw==
X-Gm-Message-State: AOAM532yIDGK5p21Hfxory7la4G7TvsNewxijavhx5IRirgGpcuC+w6q
 DXpYZ1cgRuB9sG+O5WzNI7S8BRIXGG9GbBiLNNPUlw==
X-Google-Smtp-Source: ABdhPJxJdoUfL7Na9pv4TPbOhdVT16g8SCas8hbxRD9wkYxYOAC6HLsTEj8L3HiugXvF3P9AS5qpGWRXfTs8rzXSWFE=
X-Received: by 2002:a05:6808:60e:: with SMTP id
 y14mr2618437oih.162.1639625367674; 
 Wed, 15 Dec 2021 19:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20211215214022.146391-1-julianbraha@gmail.com>
In-Reply-To: <20211215214022.146391-1-julianbraha@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Dec 2021 04:29:15 +0100
Message-ID: <CACRpkdYngi90omV64yj4OEQysKhVVaOpwXAThUtv51Rv9NvxNw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: aspeed: fix unmet dependencies on MFD_SYSCON
 for PINCTRL_ASPEED
To: Julian Braha <julianbraha@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 fazilyildiran@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 15, 2021 at 10:40 PM Julian Braha <julianbraha@gmail.com> wrote:

> When PINCTRL_ASPEED_G* is selected,
> and MFD_SYSCON is not selected,
> Kbuild gives the following warnings:

Patch applied as nonurgent fix.

Yours,
Linus Walleij
