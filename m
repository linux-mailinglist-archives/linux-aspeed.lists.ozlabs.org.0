Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1AC3E1C4A
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Aug 2021 21:17:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggdfb5rnQz3cT8
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Aug 2021 05:17:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=rZfImNjU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rZfImNjU; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgdfT4Gm2z301P
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Aug 2021 05:17:33 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id k65so10722331yba.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Aug 2021 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J1oBE/JZctwvY9/E3kDE8FEQNmppbr9cSRzTu7YvZ0Y=;
 b=rZfImNjUA9T5kYuCxueswObm20x0VPHWXchNYL365Azxq1gGu1PAXgS3u43OZdHt63
 L3YrcUzdcNpaMRl45/HmLLPPq80TpJFwS9qo1+nP7gblD72Qw40IZSkxJhXw4nS0Ubla
 0HvcfnDlKReBLGi7dVJ8KZbFx+PtPOXOG1x+XqaQW/tr6SENJtnAcOJtlt1b08ANYuTR
 t+x/AhkkIRluEZUVwP1CD7gse/Y5rzHvAx2m5AWMPWgKltQxYCQRr6rOaX0T+CLfDv+g
 3KZXQNdHM7U8uc/AIwd/fyQFeoxrK8ld3tHAVQaL/rf2sMUWRy0GwA5w6EIemnLSnKOT
 8KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1oBE/JZctwvY9/E3kDE8FEQNmppbr9cSRzTu7YvZ0Y=;
 b=K1/KGr2jiz+9d46Im3f4moFenTgJl7LI85IvuB26UGnDWMya5L4LiQGsSQoo+n9xKO
 f1qgzqWSJb7Fe2Dpq3IZoC7xbXsEsCk8MQr3+aYv3wRkMr3POyPdcMeD+8PHwemNnq1K
 30puLx2rxx0SmNGs4tKGAXC/6pbVEaSzwd+iNgnXR1X/ZA8nNWfz2ILsHXUXdSMFh/yl
 9GpgOpgxCdOmU6olCs3M8GDAg5e67Ds+TNJg0KO7dPc13Vf3E2zphM1blC3nVbCm3yTg
 bgC3CERMst/Zv1fTTY+k93se+8rA7Wl71m5Qug/DOaBsUVLwhWq8eQGm71UvFGZyuJQz
 3qHQ==
X-Gm-Message-State: AOAM532tSkuYhpzDtu9qQBIgT8Y9t9hZkRRN/ph5OviysF2roFSszbZs
 CSVyKk/Zch6A+YrgG+L/mSZVcglN1fnPxDtw4A+SOg==
X-Google-Smtp-Source: ABdhPJzEJr19LH8WK0U19g0Yr7jCDdGqOaGwS1PQYJwN+sYLUCJZhrl+cK4j5kR6Igy8OtSgXgk+Sqbbi3+WJsaIfIw=
X-Received: by 2002:a25:2d50:: with SMTP id s16mr253020ybe.469.1628191051550; 
 Thu, 05 Aug 2021 12:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
 <20210723031615.GA10457@aspeedtech.com>
 <CAMpxmJU4jN-hpNYPLHLbjx4uZ6vDqcyuMVQXhHg1BWXOqyS22A@mail.gmail.com>
 <58256e8f-6c9a-4ad4-b51e-4048b6feb42a@www.fastmail.com>
 <CACPK8XdfisvSzr3uWYmfd+u1UtM5+cyMBMvcDZJ+jQ38A1BSXg@mail.gmail.com>
In-Reply-To: <CACPK8XdfisvSzr3uWYmfd+u1UtM5+cyMBMvcDZJ+jQ38A1BSXg@mail.gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 5 Aug 2021 21:17:20 +0200
Message-ID: <CAMpxmJVHEj12D0RsV51YnKeD9OZUZzve2--pM9vWbBSZdrz7dA@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
To: Joel Stanley <joel@jms.id.au>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 3, 2021 at 7:58 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 3 Aug 2021 at 04:49, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 23 Jul 2021, at 17:00, Bartosz Golaszewski wrote:
> > > Joel, Andrew: can I take the GPIO patches through the GPIO tree and
> > > you'll take the ARM patches separately into v5.15?
> >
> > I think that should be okay. I'll poke Joel.
>
> Yes, that's fine. I have merged the first four patches into the aspeed tree.
>
> Cheers,
>
> Joel

Thanks, I applied patches 5-9 to the GPIO tree.

Bart
