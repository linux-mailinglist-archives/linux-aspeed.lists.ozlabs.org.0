Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A574CB202
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:12:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87f22yRQz3bZf
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:12:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NEmpYuhx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=NEmpYuhx; 
 dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7RZP3N1Xz30Mt
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 06:07:07 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id t13so16512351lfd.9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Mar 2022 11:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+FYbGAw6yxU17iUDUp61Ry7f+ZSO9wN0ehJ+hGfk2DQ=;
 b=NEmpYuhxkY3jphhiKwB9rL7CFHETV0OarciDwH/Y25b8gogpFDGLbcsm2Hp5JlhbRM
 fgLdNaX0z1k1bpDTdAa2T+xhPoQGBlkWInAyVtxomjmoWydKKz6S1Vw5P8QyPxUNcXPG
 O8s4ZVUjpR1ZVkG2oqZOMI9ApgRXI/RsyC5iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+FYbGAw6yxU17iUDUp61Ry7f+ZSO9wN0ehJ+hGfk2DQ=;
 b=4pjDw02ha+M5/Fa4J+hcQFs0F9HHLkJ07xi/wL44icAGwzP0Fxrn9HWJ2srYk/FagB
 9DUFUU+o0TuKkmRNX0RdniBmQd4c57saDDctqDk+xRWtXigotqkSfzdV4UVIyO0i7N4c
 jCE/HmXwPz5XHIDo+vZHAAJPkBeWzjCWZyH61IaR5m5n1E4y7A8ktNrIn/a0FuljuvM9
 zul9n3izUxuo5Vex4yly0Llkd1ZcQJRXi5B+7AvY2LC+fTwU3DGNmeADvlV3/nHy0gOA
 BpaHjWJD4Ovr47zbSTy26ubDnutBUZVaCZh2YBivNvdueJmwyFtM0BH9AbaNy9Jxhm0y
 cMVg==
X-Gm-Message-State: AOAM532FwoF863DCP8qkzQHjj0XTih8J6rRW8Cxq97xB6hLHyzP4I/sg
 nlMOAiDUWjaEmVgKxF0v46y5lYN93z7eOEE8HxA=
X-Google-Smtp-Source: ABdhPJwmlgINPP0+vpQ8IyFVHTbQd2ioIRvhQ1UDBkht2HmDzw00z2rNuzOMqOWp6zfN4egkarmd9g==
X-Received: by 2002:ac2:47e9:0:b0:445:8e83:db7c with SMTP id
 b9-20020ac247e9000000b004458e83db7cmr10881062lfp.42.1646161624299; 
 Tue, 01 Mar 2022 11:07:04 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 m12-20020a056512114c00b00443ffe02a1fsm1624420lfg.281.2022.03.01.11.07.02
 for <linux-aspeed@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 11:07:02 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id bn33so23181848ljb.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Mar 2022 11:07:02 -0800 (PST)
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id
 w19-20020a2e3013000000b002462ca9365emr17902580ljw.291.1646161622598; Tue, 01
 Mar 2022 11:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
In-Reply-To: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 11:06:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
Message-ID: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Mar 2022 09:11:13 +1100
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 2:29 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> However, if the desire is really to poison the loop variable then we
> can do
>
> #define list_for_each_entry(pos, head, member)                          \
>         for (pos = list_first_entry(head, typeof(*pos), member);        \
>              !list_entry_is_head(pos, head, member) && ((pos = NULL) == NULL;                   \
>              pos = list_next_entry(pos, member))
>
> Which would at least set pos to NULL when the loop completes.

That would actually have been excellent if we had done that
originally. It would not only avoid the stale and incorrectly typed
head entry left-over turd, it would also have made it very easy to
test for "did I find an entry in the loop".

But I don't much like it in the situation we are now.

Why? Mainly because it basically changes the semantics of the loop
_without_ any warnings about it.  And we don't actually get the
advantage of the nicer semantics, because we can't actually make code
do

        list_for_each_entry(entry, ....) {
                ..
        }
        if (!entry)
                return -ESRCH;
        .. use the entry we found ..

because that would be a disaster for back-porting, plus it would be a
flag-day issue (ie we'd have to change the semantics of the loop at
the same time we change every single user).

So instead of that simple "if (!entry)", we'd effectively have to
continue to use something that still works with the old world order
(ie that "if (list_entry_is_head())" model).

So we couldn't really take _advantage_ of the nicer semantics, and
we'd not even get a warning if somebody does it wrong - the code would
just silently do the wrong thing.

IOW: I don't think you are wrong about that patch: it would solve the
problem that Jakob wants to solve, and it would have absolutely been
much better if we had done this from the beginning. But I think that
in our current situation, it's actually a really fragile solution to
the "don't do that then" problem we have.

              Linus
