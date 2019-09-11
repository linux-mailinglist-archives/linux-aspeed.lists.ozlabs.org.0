Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73AAF9FF
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 12:10:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SyMN3NT9zF27l
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 20:10:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="weAyWjo4"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyMG0BpmzF27R
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 20:10:17 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id l11so15962509lfk.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fd44UJ2qp7SxlmPH92Hh2fZtRoYOa2yVKq8dtzIHoUY=;
 b=weAyWjo4quJcwmENKcNerNmyN+gz/QJ9hYm8rmn0/rQ4AF+hN9LftSYTgS3KxWM9dR
 tlgY+fTeAXsDs4FJRXwaCuDUUcOv2DWlkbSIIiob2peEB4Hnw81+IpJetrTGCEbx7O2I
 9Yl6U/Lfnxb4U4Jv1lwMercoCINucwno4J2A0Jf/rYQ26oAWmb4i8bR8Zl986fCF3crW
 ZNeQ+TUh0b9lN4q6SdlSC5UDgTPgH3z1QVTZQtYPrJHV4hgeFpDRZQD1+vDtcmyzoI6N
 2fCBXQEVf8qcPbNDTCxRpJQyxaAo2YjTtrJxGC033lysc/91IdDBTbwvU/a3KTj20yWw
 dR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fd44UJ2qp7SxlmPH92Hh2fZtRoYOa2yVKq8dtzIHoUY=;
 b=sPafC0Co1pHIKb2aqNxXrBtpxMRr4tYJIZMTLOFZsAgfaV94Mdo3Oym8MEyMpPEL6W
 Vork2n8I4dnW3JoC3apJJci87tpr3VOkRVgGnpmlpVm3LcOo6RhMl3sGV/x2CxPSERD3
 ELDxnRaeoE7BUUkDSHkQsJovYyjhPEiGvbBRg4SSpIOiNbnWjObXvkTLSoo8ssSmTaiO
 R/qZrvdrLS664s4VDrKaNEJntQuPkZBQpZSL/6yv2D3xtUwMarL+XLOTNIoSc+Bl5Q1W
 43DSSylioK7kjfOUUy96kBCQPBIH7857eSWV25JDm2rLTfTxFVtZzDHjvduDHvntUtsc
 mUYg==
X-Gm-Message-State: APjAAAVb4UzLVScSbYBO7QNeFEl5VYPlMgKZ5SuuhlOh3pzYo6n1u4Wc
 x0muIt3WXVg2QJNPYMPtbCVEvyaBARA/Jde3SFFbrQ==
X-Google-Smtp-Source: APXvYqxXrKv8m/NgHM1ig0qAYSi29B4YPdGe3bL55eGb9Rww2zvzQ3IpVfOta67Ay2PtbrLdxjwEiKNEmAnXzj6hqYE=
X-Received: by 2002:a19:48c3:: with SMTP id
 v186mr23663867lfa.141.1568196614289; 
 Wed, 11 Sep 2019 03:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062644.13445-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062644.13445-1-rashmica.g@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 11:10:02 +0100
Message-ID: <CACRpkda7WAZxUSjOXRj5Q1mSC0ZhYey2E9RkuX7p6Wcs_kXB=w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio/aspeed: Setup irqchip dynamically
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

On Fri, Sep 6, 2019 at 7:26 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> This is in preparation for adding ast2600 support. The ast2600 SoC
> requires two instances of the GPIO driver as it has two GPIO
> controllers. Each instance needs it's own irqchip.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Patch applied with Joel's ACK, needed some fuzzing but
fixed it up.

Yours,
Linus Walleij
