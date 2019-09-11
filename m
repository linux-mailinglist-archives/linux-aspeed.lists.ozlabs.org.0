Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3500AFA11
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 12:12:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SyPy3nT4zF27g
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 20:12:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="anZV1hGs"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyPr4B11zF27R
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 20:12:31 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id h2so12914499ljk.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3M63LrG7x4EL82UFdpWrP/9mQ7ENkTmec+0FbO71I3U=;
 b=anZV1hGsHQ0z1I7A96aJmqJ9C+jSf5S0WZzmj5riq0TO4C4XTdh61XfESCOdVK7/HG
 ZcTZZMCmwGzHPy5ca0/pD2rQcHMIabGHMDDjeILV3sHF1ZLht/o0tdV8knjUIh4joiLw
 m3FrJZldDwYb1O8mcZRFFIXGvaGsfVCE6YENAm0fSjYHk7QyrQPTqsBvX56MG6kpaGKk
 OkHG31ufBamCooV1exe8XXHIX+PLLKnYXIALwiNdE7gjhUggrNU5LAhZqnARlj8naLfQ
 rHUphgQfJU2v6QXgckORHG3H4aH8VQiYhBGjvyOjG4T/L38EwZktvb0+eeqZTAm3D/1z
 tXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3M63LrG7x4EL82UFdpWrP/9mQ7ENkTmec+0FbO71I3U=;
 b=R6bsZRYwselUfgf9E9FhuPgvJDBK/iRIjXGxeV2NvnNXBzds6Tuz8Yp13PBWBX3PD1
 dBTNPRuwvajZHdhjob00IB8Ua11SRfbY/6p/47dJF0y5Z6pcKXX1E2+SRO/KBj/PQsgn
 FBWkNNmvBwqfQSC3BqE6cS1RofNa9fEg+r2F8z3r5KnClqojPaMdvkgDO8tIpobUoFni
 Q4zzynkQxlrJHidhTnWF/Cj5GvaLJkW+eFHZrL6+xHLr79n+mGfv6II65GBgIcMJKL+O
 p4ObCihZx1Wvs5vVOoPX4KFDGRptvLM6waM3dulo5rBa1iyTb4iW7b7iBQpkknmkQEo5
 yirg==
X-Gm-Message-State: APjAAAXd4ClT1cvptPGwcDBZIqMPZisHdHlBpWpn5Hj39+5yFDV7DLNK
 +Sv05bOSk0H+9QUMZ/eh4f+X8D+bw65WQH2irK6yL98JB0363g==
X-Google-Smtp-Source: APXvYqwTtRm0wqQ33imjK5cfMhNwbKoP0HS+Yel+sv1lad66NjfwlsknxBwRjBLiSYx4GLneZb/79nnkLvotk3xijGU=
X-Received: by 2002:a05:651c:1108:: with SMTP id
 d8mr14938226ljo.180.1568196747444; 
 Wed, 11 Sep 2019 03:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062727.13521-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062727.13521-1-rashmica.g@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 11:12:15 +0100
Message-ID: <CACRpkdYbyHtC_gQqvc5cwYGqUPt1cYTW0cQVxPDah4XrdYB8Kw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpios: Use ngpio property from device tree if
 available
To: Rashmica Gupta <rashmica.g@gmail.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 6, 2019 at 7:27 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> Use the ngpio property from the device tree if it exists. If it doesn't
> then fallback to the hardcoded value in the config.
>
> This is in preparation for adding ast2600 support. The ast2600 SoC has
> two GPIO controllers and so requires two instances of the GPIO driver.
> We use the ngpio property to different between them as they have
> different numbers of GPIOs.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Patch applied with some fuzzing.

Yours,
Linus Walleij
