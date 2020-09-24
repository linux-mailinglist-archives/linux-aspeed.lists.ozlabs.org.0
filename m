Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622E2771EF
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 15:13:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxwTr3Z3GzDqjT
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 23:13:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ZhMBPNQc; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxwRm5jc3zDqhC
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 23:11:45 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id nw23so4412852ejb.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d6KirD9EXogJ4rZJQXX3ptf6I4wM6ASOXJms4dQX+94=;
 b=ZhMBPNQcf28Yt2lHYT+OHZAdIx3yiMf2LJsxNli5PUxfad4XzRToF8iyR6VnLOgo1m
 P3O1k02I+SFChVRMSGQ53HKWAvpK6LOFefJfwali9DWLK5PN6U5PQRF6jD5fX1w6UsAk
 NRJ53ni8+867wAplO3jaC5YqCwrNLUnahfR3hPVozbk1WiDlGeVB2T9dKJIU7dtYyjyO
 2t1UHvaE2SIisqosVsLv94bCRiE/vWc9OIHATdrh1Rs4ePyApnYUvYcErzamiWi1Dhjl
 8TsGeI9oRCj8S5jjhnnWK8at+BvxVpfgmK0iiibm09l5nA3oI+0zwxAE8Z+ptVtFsN37
 KI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d6KirD9EXogJ4rZJQXX3ptf6I4wM6ASOXJms4dQX+94=;
 b=CbeTPCW4d59DByxX+VC60vd9SUdEG/aPZMTt0bPmQTIM5AYnVkqvDhPouZixSGF3J0
 rSRJkPPos9d2Xh0tJuL0a3WsTKVqTxsFLmLRzplU6pnbveW7raHJKHuji462mJcJLqlT
 pX/yZKJl8dciQ7Vj/MJRjnqzt433DgiZaKn/xjpN3NTPSedJ+p6Q6j05Q1lUiMfbuVGQ
 srugb2PJSkKUuh1aw/8EaOBhQMoweEsuOSqbHkgp8md9dCFPbxlYzgm+MIivPG89m0AH
 HqnS2u6kBW0IMZYIdOm4R8D9x2XVwdvpIbSf3wwIr1+8oWMZxdDX0m3qD6KrAB6zCZz+
 uq0Q==
X-Gm-Message-State: AOAM530a+nZ9VYugqzwypqb9QXW5Yw1zCw5s/awuEUz65b+DMnrcktiK
 xShOSGqgQ4z8DLPv3DZr4hNpB/zkGqh/hOq3vVFmpQ==
X-Google-Smtp-Source: ABdhPJw3akn1PeO9dv8nYxrkCw9k5Pgola2iVlAs1aCOPnrNGPrIV2RxkbWRC8roXNvYBwMPJ3CHgcTZUlBPthPycRY=
X-Received: by 2002:a17:906:a198:: with SMTP id
 s24mr970854ejy.154.1600953099274; 
 Thu, 24 Sep 2020 06:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <CACPK8XdCkw7ix2J9WyOXDcwsMThXwQ62=E6cDLX+-9WJMsqrnA@mail.gmail.com>
 <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com>
 <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com>
 <CACPK8Xcqu3UN3o=9pZ269O6pxLOra98jYxZqVL7sfjkUZ4Wang@mail.gmail.com>
In-Reply-To: <CACPK8Xcqu3UN3o=9pZ269O6pxLOra98jYxZqVL7sfjkUZ4Wang@mail.gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 24 Sep 2020 15:11:28 +0200
Message-ID: <CAMpxmJX7yg0Y2ibEdQaDb5MseT4Kr1-uG+RLxxKO_YF1BMkqEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 2:59 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 16 Sep 2020 at 11:09, Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Wed, Sep 16, 2020 at 6:51 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > Hi GPIO maintainers,
> > >
> > > On Fri, 11 Sep 2020 at 02:20, Joel Stanley <joel@jms.id.au> wrote:
> > > >
> > > > On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
> > > > >
> > > > > Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> > > > > corresponding to the 80 status bits available in hardware. Each of these
> > > > > lines can be configured as either an input or an output.
> > > > >
> > > > > However, each of these GPIOs is actually an input *and* an output; we
> > > > > actually have 80 inputs plus 80 outputs.
> > > > >
> > > > > This change expands the maximum number of GPIOs to 160; the lower half
> > > > > of this range are the input-only GPIOs, the upper half are the outputs.
> > > > > We fix the GPIO directions to correspond to this mapping.
> > > > >
> > > > > This also fixes a bug when setting GPIOs - we were reading from the
> > > > > input register, making it impossible to set more than one output GPIO.
> > > > >
> > > > > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > > > > Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> > > >
> > > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > >
> > > This series is good to go in for 5.10:
> > >
> >
> > Hi Joel,
> >
> > I don't have this in my inbox. Did you copy me on this series?
>
> I did not; I am not the author of the patches as you can see.
>
> I notice that Jeremy sent them to the linux-gpio list, but you were
> not copied. Are you able to grab them from lore, or do you need him to
> resend them?
>
> Cheers,
>
> Joel

Now queued, thanks.

Bartosz
