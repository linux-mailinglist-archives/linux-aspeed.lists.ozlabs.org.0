Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8374453D63
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 01:59:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv4Mt621Yz2yPY
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 11:59:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=PhRgNGxZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=PhRgNGxZ; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4Mp6psvz2xsp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 11:59:49 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id bu18so2495643lfb.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 16:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLTlrl3ceGi5z9+GjYkrQ5MRqyQtQVU+osGtgt7eYUs=;
 b=PhRgNGxZsolgkV2hYWlB9MAwEffULLHk7ovaxJiIkO/TSOLac36vCe+lP+r/tECeQp
 ahrR5FWb7dItK4a7F4k9Z5iUawQtcOjT+1baVTzeol7w2DzfpbdYPkUYfFYhVomRQSuZ
 o+6U4hHe+kgEy1zgNkrWZgzLyUGpzHLObHolM6pcq9BdxQKHivmuHu21NMic66bl6TNy
 dyONUztauRy+F3xUfd8Xbqb+N7zjnW78Hc2drolpwuxfQ6TYEY5NeNtC4Hz1KvIwiW1/
 CEP/3GC+SntwBK3Pyul8tnY3IxT1kr0rra8BSHG8ec+BKb6XaxtBvWOg+o1QYDrEmJWV
 2kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLTlrl3ceGi5z9+GjYkrQ5MRqyQtQVU+osGtgt7eYUs=;
 b=oD110tUva/CTrTFZDeki7zAZGkYk7IsFHFSE+mRDo8NVIN9m53iGcuLmJxm8zWNRBz
 XR6+NqOIfvPSv1D8z6sUkgrt1B8LvdnLW43aU9P0Y+Qpzu5BIC/Qs+o7PDIdeOF8hPmH
 NLgCWwjzHEBbvE6udccvTw5cqc9t4PHhPgc81HGKcSlSVxkzqdaL6lOlZPPF+d8edMtt
 dF4js8DHi7vNh68jc5hGYnPa7oBz9d7DNw4a8PArb7INW3QK7BNt9VtPjjsTxBvIyPtT
 gpnNVwMmNKoRTb43QtF7YZhSCdc11KXUzgE4lCE7o7dJXVP1l04Oi3+LlWUTFXhlxAFL
 cSFQ==
X-Gm-Message-State: AOAM530f6q3JjxDZtZ5uwFziMRqRz7xR+upBaFilj/qM1m1I1V3rgmkZ
 2dtBcRuGrEzJIMsmoikh1TQdTF0v92POPZ8XuE0XDw==
X-Google-Smtp-Source: ABdhPJwgYXiemp8qXKRK41Pj3gqfjtRm8naFNbMxcWjM8sWxILiSc3UQ5b8KU7Oe0/BxiG0lXFxThhHBnRiAMClCrRE=
X-Received: by 2002:ac2:5091:: with SMTP id f17mr9685791lfm.206.1637110784369; 
 Tue, 16 Nov 2021 16:59:44 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
 <CACPK8Xc_B4T-xAcQ7sSqOuVLpwBw69mmj7=5T_opr2AqUs7ThQ@mail.gmail.com>
In-Reply-To: <CACPK8Xc_B4T-xAcQ7sSqOuVLpwBw69mmj7=5T_opr2AqUs7ThQ@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 16 Nov 2021 19:59:28 -0500
Message-ID: <CABoTLcQP+kSD2zO2O-_U23Xmi1e1YrjqVDRy3sCviXJ5K9pruw@mail.gmail.com>
Subject: Re: vga_pw sysfs file
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel

> > In uart_render_controller, however, we're checking whether the bottom
> > 8 bit equal to 0xa8 (why are we not checking for != 0 here?)
>
> I think you found a mistake in the new sysfs file. I can't recall why
> I masked the value the way I did.

Ha, and I thought I'd have to argue my case ;-)

> Thanks for investigating this. I'll send a patch to the kernel and if
> you could test it that would be appreciated.

Absolutely. I assume this will just be a 1-liner. I have the system
setup and can test at any time.

Alternatively, I'd also be happy to send it through.

Thanks
Oskar.
