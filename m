Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CB456AA4
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 08:08:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwSRn6jYBz305K
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 18:08:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kByWC2nB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d;
 helo=mail-il1-x12d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kByWC2nB; dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwSRg0dWzz2xt5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Nov 2021 18:07:57 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id j21so3768975ila.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Nov 2021 23:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XEh/s7tEdVrId7D7QdtgSAFRrftVLOXkLbJ19XutxWo=;
 b=kByWC2nB/lrIOImrNRp9613Bx2cw61Zwb+qRj+mIkfc5aFTVXtREYDEVOho75m/Qfs
 NmNdzqNDpb1H1FxxAp3y0rgQu5ubFs6vuVmF/vV6Sa68cTZ0OaWJXk0hd8U3wMz/J1R0
 i2JA3UJPajx7bYz4IeLNJ85+dctJNiy8xfL9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEh/s7tEdVrId7D7QdtgSAFRrftVLOXkLbJ19XutxWo=;
 b=HEbV3g4rLWj3tnIEnj/DjIjPMe9kHsaXERdIlsIg+XEopmiwB3DHBeaKzvdzfNh7+F
 7afZoO4xE4EHbKjm9O8GD6lXCJz8OtNrs+u3dGXcihS+JujGLSnxVK/ziN0KNVEK4ZOa
 59eR1wNkH2ks67HtNKryOZ1t7B05jMPlmRsW7tle9UGSH8ebS7VAC60BTmUB5tiWL5my
 yaBP9oa+ZMde0lA50mbHVjk7U7RJbKvdbcsAhab+mDix2pp922Uib0kXRGi4muHO+Hj3
 NMdQoQulg9ouQJtA5cGZIBwVDSzGNgO97FnptsajYVaDg4YDls5B4CD82949vxHjkWMT
 svug==
X-Gm-Message-State: AOAM530QfWQ9zvHmz4y81Z6UdO/mctUfpCw8YqrDXtSmrA8ACZSZnLzF
 /uIJMqdqW/T71f+hqkZCjZmE/UoGJ946A1GXNEY=
X-Google-Smtp-Source: ABdhPJz0WkViNZyZZO//jSY64Wq1P9G8AX4O2vABPNOb5F+G0JSY4iPJkhSB0KQvvTxC1uLkIBnxUzZkYqP+UhzhX44=
X-Received: by 2002:a05:6e02:15c7:: with SMTP id
 q7mr3309423ilu.196.1637305672050; 
 Thu, 18 Nov 2021 23:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117010145.297253-1-joel@jms.id.au>
 <483e616cb69c780f6102ae058a26704a0443d38f.camel@codeconstruct.com.au>
In-Reply-To: <483e616cb69c780f6102ae058a26704a0443d38f.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 19 Nov 2021 07:07:39 +0000
Message-ID: <CACPK8XeKqpLdNQp8Em1ZSPPcJA111SyCSb_NhoKNER209toLCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/aspeed: Fix vga_pw sysfs output
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Oskar Senft <osk@google.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi David, Daniel,

On Fri, 19 Nov 2021 at 06:54, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> > Before the drm driver had support for this file there was a driver
> > that exposed the contents of the vga password register to userspace.
> > It would present the entire register instead of interpreting it.
> >
> > The drm implementation chose to mask of the lower bit, without
> > explaining why. This breaks the existing userspace, which is looking
> > for 0xa8 in the lower byte.
> >
> > Change our implementation to expose the entire register.
>
> As a userspace consumer of this:
>
> Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Am I okay to apply this to drm-misc-fixes? I've not applied a patch to
the fixes tree before, so I wanted to check if there is some process
I've missed.

Cheers,

Joel
