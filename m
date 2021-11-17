Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A2453D6B
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 02:04:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv4Tg2XyVz2yPs
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 12:04:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fPWO/v8q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fPWO/v8q; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4TY4qQFz2x9C
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 12:04:49 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id i13so854649qvm.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 17:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9vBUbbM00hOLSBMGDbQk/TFhqpco8ylL3bmaXGm55g=;
 b=fPWO/v8qKUwk2ZSYdcez0XcerYo1sN+qidybUCQpI4QFvT/s8NCUXVr7rPONCqvupV
 kn5B2dMR5kazAjfUuUfspQ6atthlhrsF6afmAKKkUP8WqDoL4BPE34xhFr6EaMASt9uh
 1OuV/bUzUiUlBcy1kFENXL1ICWEBvQuIy6T0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9vBUbbM00hOLSBMGDbQk/TFhqpco8ylL3bmaXGm55g=;
 b=zmSTc43uqyOwpfDXyQnJ0YhzudYRVWt/WMP509C3h4GNgWLeuNWFxw8DLfBUmC4E30
 txQJx+OhE+ic9dc3BovOeqQuA9yi1q2U2fpUcnqMXfisBPmE+ZufXA5kSTlTPp1BALSc
 +4g5Sy7hXwv2bVkSKmP2OWvLv2y+RmqvKDVxANgBBMFQOYQzpD2KB/iQdAjLlO0gplvu
 DF8Ym7t0Ise0P8QZoyCV3gyStwMwpBBCI4pBYiM+a+eUUM75Sc02Z4+U7ApvbMHWb6UF
 GGao6Z0WDCJy/pH1jKQuw+zRIgOrsj6pPwZ/oJ8cNHRxdrSFvWENFuSmh5t+dnGvxZ0o
 ihfA==
X-Gm-Message-State: AOAM5306yeRMgTwqwNoq/BfXQALL8miE/MUk2hXPd8J7+Fcwuqu6tQq5
 tEIEI9vRYsFYehx4ByDbVdeASq9pyOAVhd2xiVY=
X-Google-Smtp-Source: ABdhPJzOVafHyDAqtx5D9J7vUKB4SrIzTWTaVi0937gm+t1e8mp7jDgukc9U3M8lyDx3tbyVg/EbcRH3z7huJ6Y0fPU=
X-Received: by 2002:a05:6214:e41:: with SMTP id
 o1mr50972856qvc.43.1637111086875; 
 Tue, 16 Nov 2021 17:04:46 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
 <CACPK8Xc_B4T-xAcQ7sSqOuVLpwBw69mmj7=5T_opr2AqUs7ThQ@mail.gmail.com>
 <CABoTLcQP+kSD2zO2O-_U23Xmi1e1YrjqVDRy3sCviXJ5K9pruw@mail.gmail.com>
In-Reply-To: <CABoTLcQP+kSD2zO2O-_U23Xmi1e1YrjqVDRy3sCviXJ5K9pruw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Nov 2021 01:04:31 +0000
Message-ID: <CACPK8Xed0JN9drM6Apz=k24K06KT-gnooBjWeu8MAwNjxUNh3g@mail.gmail.com>
Subject: Re: vga_pw sysfs file
To: Oskar Senft <osk@google.com>
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

On Wed, 17 Nov 2021 at 00:59, Oskar Senft <osk@google.com> wrote:
>
> Hi Joel
>
> > > In uart_render_controller, however, we're checking whether the bottom
> > > 8 bit equal to 0xa8 (why are we not checking for != 0 here?)
> >
> > I think you found a mistake in the new sysfs file. I can't recall why
> > I masked the value the way I did.
>
> Ha, and I thought I'd have to argue my case ;-)
>
> > Thanks for investigating this. I'll send a patch to the kernel and if
> > you could test it that would be appreciated.
>
> Absolutely. I assume this will just be a 1-liner. I have the system
> setup and can test at any time.

Here we go:

 https://lore.kernel.org/all/20211117010145.297253-1-joel@jms.id.au/

Thanks for the detailed bug report. Please reply to that mail with
your tested-by once you've confirmed this works.

Cheers,

Joel
