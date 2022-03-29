Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCBE4EB300
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 19:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSckH00g7z2yP7
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:58:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c7hmFmhA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=aaelhaj@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=c7hmFmhA; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSck73vBhz2xZB
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 04:58:21 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id g9so30451757ybf.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfXvsdGt/25h5fNG8H1uxlVvZsMmUrYBtSkMng4/6E0=;
 b=c7hmFmhA3h/KUgbpWode4/bKqY9ujXjmYOpboZ+UXqCicTgcsd6SaXyjG/iM116cD5
 SzZKADs38rbHfpr5U84mvr8ngRQD9ewZzgWgzRSLGObaxJWemj2uS3mSatREoo4ugget
 ry6yBRTQN3xawQH14wHBM1pK19C6lcTPpuVVzDhkxbg4oSlGaDCiSBAu4O8itbPp7d3X
 s0VJFMm7Bs23aOXeEXaRLEiqz7KjcLOVr8X2oHRleueX6dmG8MVAJ/tYYGwbBTbZAEAX
 DfmuH4B7ChqGuw/IKi1EI/+daltTbIU1nhDaMHzEnE9TPAlHPVCr+Qn4hXaNPe5wo6u5
 0ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfXvsdGt/25h5fNG8H1uxlVvZsMmUrYBtSkMng4/6E0=;
 b=QcJ2mmkwsWuSFCXDmH4tCi9wSpO+uEvMfx4DOb5yaJ/wDqisbNsLSyO4ayG2+55+lg
 O/mqLV8lPFjc4Q+fTBUcucKD1cpqaz/QrKo5xpH5qez8RCD1RqZtyE0cEyJ4X9N+Y51c
 WTchYnIOY76/I8vxLvUuOJNw/K0jyqL2Aez3V0AhmK8Yq9zVPe6pD3Jts5BPTg0G57dD
 EXzSEW19kOLf/ejGbau/wPdRibdzGOPVh5ErE2V9RgmjPZkcJkXqhcYp/CNXcL++Alif
 i7XJBD8UOG2BC8ijpeKqF3QZzbmD6Tboj4DBxzU4repSJkLhw0Zu7XnhOdkdLA72zd55
 IWYw==
X-Gm-Message-State: AOAM531YaxOzwhzJYAPRb8rYcXKsDc3pBnHOD7/2gCJG369oSUZBYf31
 lx+rrm84gjoYTQXzdrwAu78l2bOYBE5mtXiFbNC3RQ==
X-Google-Smtp-Source: ABdhPJxTOqx3U7DdLI/nqre1zKzR2WiSFPWDFZzEVy0VebprgWthXU0XDH8n5DOInzpXTjgfS434mKx4k4LwcS5MHYY=
X-Received: by 2002:a05:6902:20e:b0:627:f1cb:a9ee with SMTP id
 j14-20020a056902020e00b00627f1cba9eemr28272819ybs.129.1648576698675; Tue, 29
 Mar 2022 10:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
 <c29de2ea-0f60-4e7f-8308-11849a7de8e8@www.fastmail.com>
In-Reply-To: <c29de2ea-0f60-4e7f-8308-11849a7de8e8@www.fastmail.com>
From: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Date: Tue, 29 Mar 2022 13:57:52 -0400
Message-ID: <CAFPZpNZ1+UDVcEs_gp1zCzxXfP6PqZ8kx+UGhb73BusiScRk+g@mail.gmail.com>
Subject: Re: aspeed2500 SPI1 control at run-time with OpenBMC
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Oskar Senft <osk@google.com>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Thanks for the reply Andrew.

> Not explicitly as I mentioned. You're also going to run into the
> constraints here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c?h=v5.17#n2739
>
> Fundamentally that needs to be changed. We could do something like have
> it default to pass-through unless a driver is bound.

Could you please elaborate on this a bit? I'm way out of my depth here
and would appreciate any additional pointers.

I already ran into the read-only constraints in the pinctrl driver,
and I have a patch that excludes SCU70[13:12], but that wasn't enough.
