Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2583652F3
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Apr 2021 09:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZbt53qKz2yZR
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Apr 2021 17:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Gx++tH4A;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Gx++tH4A; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZbq02pyz2xYj
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr 2021 17:11:16 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id u8so27956596qtq.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr 2021 00:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DyGio9SalvX0/PlzfEkjduQC/y5WfEdpA8EplVfOAKY=;
 b=Gx++tH4AZWupH+et5Effwkd0iMutrH8tdoiYP7yEr25VGnFXkssJlvBalJCttRrMp4
 gNScOAIXzH2AwqjtaYOdCbemU5IHr4byYrk0cifVfsT3BDuoGAjTAOYc9xIOMxwR6Nom
 UhBes4t0y4otC5W3lLl6pVmAoeEA4pE8yygXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DyGio9SalvX0/PlzfEkjduQC/y5WfEdpA8EplVfOAKY=;
 b=UdAo9aosykutWJDjIO9FoSxjL2XQ8HM7TAJLSVZerfZO4zYTar/QJb7MylRT/tOflK
 5cC5QMZZMkl5IXahe7TPfVOnGXERClvAPEg6LJtoy2a30AD9SuE3y8u8gBTcBDzQsnF9
 aR8e4aAtaMrsKfzaK1xLFfkFw1x5/ZNTDJgH7Vv+OI1b579+ITz+JQGvbbv1pAIQ6DOs
 h6Eso8AxlmsNjhuYE/2geqd2eavigXrj4qMJnuAQm6LXvs1ory4ggUxSH9r+1yBhSH9Z
 bCowunec6mRyoHs8O7g6HkhuZXRDAn4JVmu5ASDzcHKOH7v+fA7WnpQpelsI4KsfnZLG
 QJxQ==
X-Gm-Message-State: AOAM533rN5Mw+aH7OSkoO+x7Vw9/I9CEfEnT0e01opssRxaAWq/4Y3gZ
 PVwP5D2Jm2Gfe/FZInu9hssUTXtcHhJARZqQG9M=
X-Google-Smtp-Source: ABdhPJzRM0jLdBC1S6f8WwRWuDOdWL0MF6ILvix9Rcgs8unRf15jqAmHD7u9NAj5MuihLO9nz3BlyRgykR9CJm+2GqY=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr15120825qta.135.1618902674177; 
 Tue, 20 Apr 2021 00:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
 <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
In-Reply-To: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Apr 2021 07:11:01 +0000
Message-ID: <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 19 Apr 2021 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello Soc maintainers,
> >
> > Here are some fixes for the changes that have already been merged for v5.13.
> >
> > I also merged some changes that came in later. If you would prefer to
> > not take them then I can send a pull with just the fixes.
> >
> > The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> >
> > for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
>
> Hi Joel,
>
> something about this pull request doesn't add up, and 'b4' refuses
> to pull it since the 'since commit f0145db2' and 'up to f0145db2'
> references refer to the same commit.
>
> I assume this is just a copy-paste error on your end, but it would
> be nice if you could double-check and resend the pull request
> based on the ee33e2fb3d70 commit that I merged.

Nice catch. It looks I've generated pull requests incorrectly from
v5.5 onwards, and this is the first time we've noticed. My bash
history shows I started generating them like this:

 git request-pull tag url tag

v5.4 was the first time I'd sent a second PR for the same branch, so
when it came to generating the next one ctrl+R'd myself into the wrong
syntax and continued doing so ever since.

I'll try sending this one again now.

Cheers,

Joel
