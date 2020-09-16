Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97726C314
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 15:05:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs0gf4LtszDqWL
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 23:05:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EPYT+N9p; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs0YW30tnzDqV8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 22:59:42 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id nw23so10211789ejb.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LykIIjwDcAPlXpe116USPIGPMiw/gn67hYo/dfyuguc=;
 b=EPYT+N9pg6qQsR2GbJfFotejWklLP0rj8JOmihomV/mb/ET2IEoPdf9F4gI260Q6pj
 iW2YjRFunmacaut439pkVKHTb+K+Bsfgb2WE2cjgiPCtLqcMDAXtvxiDRJpPmxJuaRNl
 5RtTN7wxPptFnpPRrBOa9emhchndttrJkFwoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LykIIjwDcAPlXpe116USPIGPMiw/gn67hYo/dfyuguc=;
 b=aRc3fwT/WN703IkK9dbc/Jl4Lch+6c0OO9GoY4zoGqO2A4m/qtm18jTOT2nw+KzzON
 0MIQxqyJ0byGsoN+yBpytXyFc0jgXyf/49kxpJn6vnbMmgfuHxg5Zqk7O4WBZh1+vSiJ
 2DoN79bgcUKj6Q0Ij7UebgZow0VFbGhDAs4Ewiou7YKT1qno2iA8zqbUzt1f60PyEBx5
 Xvw3f/h0j9TdFwGtHLVlEmW+TzTBU/EvKlH67Ks1wNnGOcAus/+LLyXVBDYvd9G6pRkB
 V/Id7KZBcCfG2LPyIXFIbKL88cEvkYr3MACRtp+Hj7AAnKyBa+vXLvD25BoBij764WiO
 6KFQ==
X-Gm-Message-State: AOAM530X88NVVI4Lyz06XSg5mjPgXgle5hQZ8QPCP2Q0/TaLUDBZvWsO
 JWEIJ+DvF703MhsxyvRxLT9UT1ovCZiab3OW4vs=
X-Google-Smtp-Source: ABdhPJwrELSEtB2NvnOU4b9otvda3Yi7Dh3dlIzm9DOmSAaqun5cjYIE1611v65fJhzN7mxe3uxa4apYV9musqXRShk=
X-Received: by 2002:a17:906:fcc7:: with SMTP id
 qx7mr26579286ejb.254.1600261178452; 
 Wed, 16 Sep 2020 05:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <CACPK8XdCkw7ix2J9WyOXDcwsMThXwQ62=E6cDLX+-9WJMsqrnA@mail.gmail.com>
 <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com>
 <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com>
In-Reply-To: <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Sep 2020 12:59:26 +0000
Message-ID: <CACPK8Xcqu3UN3o=9pZ269O6pxLOra98jYxZqVL7sfjkUZ4Wang@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

On Wed, 16 Sep 2020 at 11:09, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Sep 16, 2020 at 6:51 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hi GPIO maintainers,
> >
> > On Fri, 11 Sep 2020 at 02:20, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
> > > >
> > > > Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> > > > corresponding to the 80 status bits available in hardware. Each of these
> > > > lines can be configured as either an input or an output.
> > > >
> > > > However, each of these GPIOs is actually an input *and* an output; we
> > > > actually have 80 inputs plus 80 outputs.
> > > >
> > > > This change expands the maximum number of GPIOs to 160; the lower half
> > > > of this range are the input-only GPIOs, the upper half are the outputs.
> > > > We fix the GPIO directions to correspond to this mapping.
> > > >
> > > > This also fixes a bug when setting GPIOs - we were reading from the
> > > > input register, making it impossible to set more than one output GPIO.
> > > >
> > > > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > > > Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> > >
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > This series is good to go in for 5.10:
> >
>
> Hi Joel,
>
> I don't have this in my inbox. Did you copy me on this series?

I did not; I am not the author of the patches as you can see.

I notice that Jeremy sent them to the linux-gpio list, but you were
not copied. Are you able to grab them from lore, or do you need him to
resend them?

Cheers,

Joel
