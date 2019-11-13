Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A5FA00C
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 02:25:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CRkR0fmCzF5CV
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 12:25:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::142; helo=mail-il1-x142.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="xqPjsBmm"; 
 dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CRkG44xzzF4pS
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 12:25:10 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id r9so194411ilq.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 17:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kv0bDYpcMFJAlS+ruPwaKvrDUfJwNNLe3oX1YHYasiw=;
 b=xqPjsBmmdT7fyxcvbYoimn3Bc9jav+Nt6AoRLPNwcZlpdJmSO+f99qz/DznnoTrfn6
 0l7CdXXGHLTiJsDITQE/zqA0YveEyusy0rsMe9YJsOCbV0BHKdyNOfn5IZ8os3aKI3j5
 g5nQ/foPXhc3GKaLzCn07b5REAr2hDKrWr1OU6SFdUnxV3tu2o+wixoqPU61wuLgDj9u
 niCwTxKFyG83OTqoobUtCZr8X7A8J9wxmeXR7qsSey2Mnbvrbje1hxNjbwRsSrGIFjwF
 QyWEF0j4dL0Gu34DdiMBe0xTIY9xYBmojNMEPV6ULi7JI8H0mE7IYPFUAxO59QypyeWA
 R+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kv0bDYpcMFJAlS+ruPwaKvrDUfJwNNLe3oX1YHYasiw=;
 b=QTI4VjfKtkwk1/men3E0m4DJg4VOT7g1eIWYTasAsZj6ETWbKSAzcmYD1zrarSF4Kh
 0ulzGeO8i416gk2uEKVBL77lyMBFJqve71VIkCB1XX2hcrYSPR4pN6Z6CP31Uyl3HShF
 j1DfvAkD8fubY8YHbXxQC8UQHjh8aDy+HD4SXwt/HMEK53dLFM7TlFHFIs61WdEKwWpW
 BUcmhZbzuDNvizLMO13JvqPykI1YV9w4U+Q4XXjbKBZLa7cgnsvYOOmg3ZXVeW36jsMe
 mVjlAbNgUgUd0RLMWomv74FmaLHtiNgXbGtLylqkoAo6POmIGqX05A9SIpKIBVbikS24
 gQzw==
X-Gm-Message-State: APjAAAVuE+eRsgrX7vA4kSasRlD5xQKYDBIKJ3mj/rH0M7bNWgr3F8E6
 Lo/uksDAmYOkOWbLjqVo5fFD69xLjrDJ4DUIm8xu0g==
X-Google-Smtp-Source: APXvYqw9TNzdlqYTyJgNfx5tGze7W4c3t1m0b2beuwXGQWfe+hkWaUbMevbCRiZS4YooA/gZmNw0GF4o9wOiuBPHWsc=
X-Received: by 2002:a92:1b1c:: with SMTP id b28mr899298ilb.278.1573608306650; 
 Tue, 12 Nov 2019 17:25:06 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xe8XiJ+oEp3_AXO5Mox-mXWVrOJKQLJMKJxg1WdYCTzMw@mail.gmail.com>
 <20191108183124.r2wdql4rmdbzx2up@localhost>
 <CACPK8XfVOGyr+ntuAhK7dOA=02PBKJYTSkv4HvoJWdppMeJNWg@mail.gmail.com>
In-Reply-To: <CACPK8XfVOGyr+ntuAhK7dOA=02PBKJYTSkv4HvoJWdppMeJNWg@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 12 Nov 2019 17:24:54 -0800
Message-ID: <CAOesGMitX4U61n6Tc9YtARPo8TsXJUoZoitr8e6iTjs_JWJT=w@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.5
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
Cc: SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 4:40 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Hey Olof,
>
> On Fri, 8 Nov 2019 at 18:32, Olof Johansson <olof@lixom.net> wrote:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
> > >     tags/aspeed-5.5-devicetree
> >
> > This is a weird format. Mind changing your script to not put the '\' at EOL?
> > It's messing up the parsing scripts, and git doesn't use it.
>
> I think I added that at your request. I'm happy to do whatever works for you.

Hah, quite possible -- we used to cut and paste to a terminal so it
was useful then. Anyway, I revised my regex here.

> > > ----------------------------------------------------------------
> >
> > ... also, there's no shortlog and no diffstat on the pull request. We usually
> > want to see those.
>
> In the past git request-pull created those. It seems to have stopped,
> as I got similar feedback on other pull requests.
>
> I guess we need to add that manually now.

Yeah, I just saw one more pull request that looked like this. Surprising.


-Olof
