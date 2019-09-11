Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0ABAFA20
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 12:15:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SySf0MS3zF0ZQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 20:14:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="IsmloQ3q"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyRS3N00zF2F8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 20:13:56 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id 7so19402326ljw.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCnVGzJ1aayFY2KVyD1Mv7oUSY3ckiY/y1eytoodkhs=;
 b=IsmloQ3qh+w0RxxWI9INZ9WRb+/A5095NFWDlOU0ojKcniCg3x8EawwhTpdwT1nI3v
 LWk8BbA4ERR32ph5dS97WZauymFdmjDcgntluwX6FCCKLbzZdAqN7tjZru61pYKlNRSV
 QYyHm/3HKhdeo+cTZaEaE87uLdzYHPpP3PD8Kid71nN1CyD+Me+ORjfm5oWjxJQ+zwlL
 y1TUbT5IxbD0E4ySpZNyKclMiNdDEVSz4nNLYlirjrjnYQNE2KKMLQsl62ayYl2m74Ju
 ATAllJQxj3IB0o1IYMuC84V5aUBxTRhsNK++jZHUBqWMNK/OxiN931IpoTJv/NAb47f3
 hIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCnVGzJ1aayFY2KVyD1Mv7oUSY3ckiY/y1eytoodkhs=;
 b=htUhy6bPC5nec0his8EgkM/A5Sl6c7tNHVSxO/SiNHNzbjlFuLt25St97K3SNkrNxp
 ZtYieWgPz0319QnEQmrpiQ6Pk3WFrmxtQSmJTw4TfrIvf+BfY9phCEzWomcsh7NSR7ji
 QW1wjPM1e/P1VrEpTmQlNzGVnwiYOHOpRxKRYnDEz34j9a2g2vIazlzubSL1Vw9kiPEO
 ti1f6GuygIn1HA4SZErmghv3SiG5l3i7sGQTiKwmgJ3HtI07Vx1buvvMPx3/MZOeKanE
 LBo4bi6Y7Sl+KGcqd8BPuR6kZlduIiJIqRAVRY9vQaxovuZw34aSPKNC6kHAIreNwa+7
 xHTA==
X-Gm-Message-State: APjAAAUg3dIhsTs/oygfETUHjSI9WU8VUMIC3z/FdI2QUkx1zXjeCDGs
 yHjogisxr04OGLXP3k5wDOMS3qpxjbue6t4JeW+5Bg==
X-Google-Smtp-Source: APXvYqwuhpQk3V/zZTpDpM2cpbb8dbSgHN/jIKUQd/PGzomP3IPupkj6DtiQG9j+nks1pOHj0dx1JhhwudEsWNFOZbI=
X-Received: by 2002:a2e:654a:: with SMTP id z71mr22911168ljb.37.1568196829591; 
 Wed, 11 Sep 2019 03:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190906063737.15428-1-rashmica.g@gmail.com>
In-Reply-To: <20190906063737.15428-1-rashmica.g@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 11:13:38 +0100
Message-ID: <CACRpkdbmusuLNfzcxxnYk=Up7UT3GMdLU4R+WnS86oTV9PNcWw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] gpio: Add in ast2600 details to Aspeed driver
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

On Fri, Sep 6, 2019 at 7:37 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
> Additionally, it has a GPIO controller for 1.8V GPIO pins.
>
> As the register names for both controllers are the same and the 36 1.8V
> GPIOs and the first 36 of the 3.3V GPIOs are all bidirectional, we can
> use the same configuration struct and use the ngpio property to
> differentiate between the two sets of GPIOs.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Patch applied.

Yours,
Linus Walleij
