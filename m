Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24448F9F5F
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 01:40:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CQkQ4KqzzF5wm
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 11:40:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TiPN95bk"; 
 dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CQkH1MfbzF5t0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 11:40:07 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id y18so125977qve.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t+hVtjPqxsrSnn17bHB9qrQWeIT/PrqO1rTw4krXmCU=;
 b=TiPN95bkizQ4voYbuODqSf9et1LPRMWqgdL5r1Yn3pOdgL46Onb4KQqOi0v50YMBhn
 K8h0ocFtT/pSwPev59WWCHMjXQh6a6LTViN4tNmygkH4uX0fSTXGvu7xEVfGtruUAEM5
 wv1Sch77i3POzdILwDoQydigQjYYwba2tuZr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+hVtjPqxsrSnn17bHB9qrQWeIT/PrqO1rTw4krXmCU=;
 b=mB5ToFXhM8gx31hD/qfbV4P+uOyGoMezbsKJZdcP88lJaEdwf9r/zS+BblJUzzJkPk
 RxgzxJAUmc0Y3rdtbgMqLyPBqx9Uh5OeFcg3Blmzx8Dt1xzgiK7+INC9AWKzK4Klk+/D
 qUo5rlJxNR8Aq3sDiWLVoK8+Xm5NE1IPJDIMSdqfFlfXFB+HDYwoFYjZKnpUy5mnnQWE
 pOLUrquoOxI4xhpJHItyWR7igNn+Ru6Bk0c2Jad5I5H/SG0+76Y8/ZOzZSBxcpoOKB8c
 pQj2fU17pKNXpMMgPsOnArLMqPgi4yJU+Ct1leymhXzR5KPR5BtBK19bT2Zf2qT5qqmL
 niyA==
X-Gm-Message-State: APjAAAUeEhBS2XkILefe59H6MfipdcruU1lUdcSk/B/ek6ZMw4GiuJKi
 X74/GpkkeYO3Upz+OuuOl4lbIu2nB991ytrraik=
X-Google-Smtp-Source: APXvYqyD/YFJfofIxaZ9C+Thi8Xw8Bo6/1Jh5ZypX0pE48SaKQ9yBWXZi8hLvz9YCbAUiXB5OTBKyk9j9njE7OAilXc=
X-Received: by 2002:a0c:a541:: with SMTP id y59mr432426qvy.107.1573605602886; 
 Tue, 12 Nov 2019 16:40:02 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xe8XiJ+oEp3_AXO5Mox-mXWVrOJKQLJMKJxg1WdYCTzMw@mail.gmail.com>
 <20191108183124.r2wdql4rmdbzx2up@localhost>
In-Reply-To: <20191108183124.r2wdql4rmdbzx2up@localhost>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 13 Nov 2019 00:39:51 +0000
Message-ID: <CACPK8XfVOGyr+ntuAhK7dOA=02PBKJYTSkv4HvoJWdppMeJNWg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.5
To: Olof Johansson <olof@lixom.net>
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
Cc: soc@kernel.org, arm <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hey Olof,

On Fri, 8 Nov 2019 at 18:32, Olof Johansson <olof@lixom.net> wrote:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
> >     tags/aspeed-5.5-devicetree
>
> This is a weird format. Mind changing your script to not put the '\' at EOL?
> It's messing up the parsing scripts, and git doesn't use it.

I think I added that at your request. I'm happy to do whatever works for you.

> > ----------------------------------------------------------------
>
> ... also, there's no shortlog and no diffstat on the pull request. We usually
> want to see those.

In the past git request-pull created those. It seems to have stopped,
as I got similar feedback on other pull requests.

I guess we need to add that manually now.

Cheers,

Joel
