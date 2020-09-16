Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591326C1F5
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 13:09:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bry6j3frvzDqWL
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 21:09:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=oeZNumN4; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bry6Z31WlzDqNp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 21:09:37 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id n13so5824968edo.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PE/vVbtZ2t56eMH+tLAsyelGad3azKLrl8SBN4ILqow=;
 b=oeZNumN4eLapOPjgfGKkLMwW5SvcAEDtbJncpyNzl7vHRtvO+lrXXaCXI3EXtGHqc4
 QbEDPsjacGEyVqGbgPg65rqE19c5Wiw1db3tqGdMRh+T3NvuWnDHwgQ6oI6UVp4cc2uB
 +iivoeIYo+ePgSLsQON36XhjUgaUbRtJ8ETChvga+MykeScfKQlSo4O2YTOf4QR9tUKI
 OsWNviLlJnInjnp6gaFHPctijKGoNQb1QPlxU8hFG7meM0iTmgrmOC43P4Ff2dKmhfk1
 B9rF/X/x6EeWFyIeC2cXpjNg70FixKga+U16QN0yMyE2Cyg5NBojO9k4Kech7k+JdbWs
 SONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PE/vVbtZ2t56eMH+tLAsyelGad3azKLrl8SBN4ILqow=;
 b=hF6IyaUgX3qQgIUE/b6Nk/S5mllNAFHdBKMcsSZ/skB7xzCZPenut8FblGwH/86zmm
 4Ukar2KUdn7wP3RW6OEVDYUPlS1xPodZ3Nir5nVzxndEMZ6rGSbHQmC0G9ccN5/U7yn6
 y4Z/OpNoChpG5LGu9Y+dgAP958C4OcXXOs1HJ4oLeWeBUoDlPdLfKv24SxWkgT2Smu7g
 VJytX2Gg6OcbSIlV2I17r+wtsMJxjJqLM/zsT4E53fe5pZw3ATXPPIg7xGR8Xf/cMId+
 lVg1KHuzRQJNECFov+oBx6KR5aWGjvIJqzcENK7V1lSxgmrM3jHksv9Vp/oG6nUzURzM
 yePA==
X-Gm-Message-State: AOAM530x4jcfae01lL8LT4CYjX6nzxBuR+/lgbb7WNkhs0EJ3Bp4UIp+
 7wWxle1Ct702fpzQP4707+vboc7CIweY0NJp4zPzjw==
X-Google-Smtp-Source: ABdhPJxdmac/FBfQsivBhz7Pi6CatnN7TB0meCEyrxgrANGU4k4nt7pw7+Ma40m3cYcGTP8UnaI2CvvHIWr7yfoEilw=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr27679411edn.371.1600254571184; 
 Wed, 16 Sep 2020 04:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <CACPK8XdCkw7ix2J9WyOXDcwsMThXwQ62=E6cDLX+-9WJMsqrnA@mail.gmail.com>
 <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com>
In-Reply-To: <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 16 Sep 2020 13:09:20 +0200
Message-ID: <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com>
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

On Wed, Sep 16, 2020 at 6:51 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hi GPIO maintainers,
>
> On Fri, 11 Sep 2020 at 02:20, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
> > >
> > > Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> > > corresponding to the 80 status bits available in hardware. Each of these
> > > lines can be configured as either an input or an output.
> > >
> > > However, each of these GPIOs is actually an input *and* an output; we
> > > actually have 80 inputs plus 80 outputs.
> > >
> > > This change expands the maximum number of GPIOs to 160; the lower half
> > > of this range are the input-only GPIOs, the upper half are the outputs.
> > > We fix the GPIO directions to correspond to this mapping.
> > >
> > > This also fixes a bug when setting GPIOs - we were reading from the
> > > input register, making it impossible to set more than one output GPIO.
> > >
> > > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > > Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> This series is good to go in for 5.10:
>

Hi Joel,

I don't have this in my inbox. Did you copy me on this series?

Bartosz
