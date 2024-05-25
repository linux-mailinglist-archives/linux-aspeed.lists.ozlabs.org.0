Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D239579B1
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKP3ZxKz3bmJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tivBEOZc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=minyard.net (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=corey@minyard.net; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vml1H4hJKz3gKK
	for <linux-aspeed@lists.ozlabs.org>; Sun, 26 May 2024 00:39:46 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6f8d0a215deso832773a34.0
        for <linux-aspeed@lists.ozlabs.org>; Sat, 25 May 2024 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1716647979; x=1717252779; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ijbRL5KgMxfBrVDKaGT/ZS1YTwf/exNuTTCo0hJfeM=;
        b=tivBEOZcHsIaGg5PcrCR7rTOyMOtFPCAu+H/Tc2UfcZYZOyfnPOPYUy/UScoTtWo9z
         7pMRNj2jcIbcBTLfKu8LgbAnYjE4nbC4mXH9IL6wI7o2xKHt5P4+ARbkVT6M1wwZRSDc
         8tzFOx6tJAoJEi5PMaoyFPq9dY/vwq7dVtlUqie8Oq6KbHC5eJtdhTwftpHRv3EObzcb
         aeNbtPhSURzRJWDeW89s48vh/4935rUDRK4MeRHszO5LDQsBYS6kgJBsE1p0YqCx2Ntt
         LTD1hlAGdUL8E1MCo8lKypoc9RGSPK19Zxd9ZIxc1VZqzjYJjiIv22y8akqmmhnXG4Nn
         9Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716647979; x=1717252779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ijbRL5KgMxfBrVDKaGT/ZS1YTwf/exNuTTCo0hJfeM=;
        b=snx1W+Bx0eBps7XALu8veCa/rUVYcDtIiH+2wpY6qcuMYyCpbvzNI/q515n63r/9L6
         FCGWuXf6lIC1c8ruhRaT3nYbKT4Sr5QM1A+1WgjC5E54nOAvmlbjigKz9dXm4++ykOaM
         EBOS51Gk/0g8QOkmZIkroVRdhZoqx+e1yii5DCP9LQ05/uXBFjhf51TCmO9fm9Fc5Xlj
         L/uydsJ6rfikj1UEGbRQY5i1pmKExMWuxZDY4dLiUONb3Cg5SSGzLgLew9xfb6QlwHZW
         skGZnSfkpjz/wy5JrSUoSX9RtaXpaQyseXQJhtXqxF5dE5DiO18VizwG5Y+jZuUj9GPO
         I4yg==
X-Forwarded-Encrypted: i=1; AJvYcCXKUPPzAcV62sRDuj8ptMkshDSnjaQ4Xci26hhGR3c9Z58Fn9yxJgsw3JHwX3fLzLZcBjLpd5k8lcUB4alk3KteIQyOTJ8NKRnY2XokgA==
X-Gm-Message-State: AOJu0YzC8wjzYA1GcH53INI7Yk2DdKazdXBqd+W+siGNJQBpHXIlvCka
	eTpH35vWS+t1DlFgoMolAR0KYUi6j4r7MRRbtjCcPMNDDfRPVTMV1rLEO9Ky4d0=
X-Google-Smtp-Source: AGHT+IF0BZKLWwLOASvb2XVCtA5cGrrbycBktJDxiP8zfqL1QN+0/jXbjbKfObTeb3B2Xr8wgSINVg==
X-Received: by 2002:a05:6830:f96:b0:6f1:248a:b5ba with SMTP id 46e09a7af769-6f7d65af20bmr3958986a34.18.1716647979022;
        Sat, 25 May 2024 07:39:39 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b41a:8a2e:362d:fa53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f8d0e61558sm768131a34.51.2024.05.25.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 07:39:38 -0700 (PDT)
Date: Sat, 25 May 2024 09:39:36 -0500
From: Corey Minyard <corey@minyard.net>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/6] ipmi: Convert to platform remove callback returning
 void
Message-ID: <ZlH4KFZ3MYzelzZK@mail.minyard.net>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
 <3uhfeeahn2u23mxyumyxcyx4kmcxzczipkan7eqh4aslsmhxyz@zgsmwj2jvb2v>
 <Zhf9mQx/KgXOzPTs@mail.minyard.net>
 <sjgseqireuaswtbuwl3rvcszpsjzph4opq52x2kbudczxutz7o@2tua2oueufdd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sjgseqireuaswtbuwl3rvcszpsjzph4opq52x2kbudczxutz7o@2tua2oueufdd>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Reply-To: corey@minyard.net
Cc: Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Tali Perry <tali.perry1@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, kernel@pengutronix.de, Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, Andrew Jeffery <andrew@codeconstruct.com.au>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, May 25, 2024 at 12:10:38PM +0200, Uwe Kleine-König wrote:
> Hello Corey,
> 
> On Thu, Apr 11, 2024 at 10:11:21AM -0500, Corey Minyard wrote:
> > On Thu, Apr 11, 2024 at 09:15:03AM +0200, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > On Tue, Mar 05, 2024 at 05:26:57PM +0100, Uwe Kleine-König wrote:
> > > > this series converts all drivers below drivers/char/ipmi to struct
> > > > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Provide a
> > > > remove callback that returns no value") for an extended explanation and the
> > > > eventual goal.
> > > > 
> > > > All conversations are trivial, because their .remove() callbacks
> > > > returned zero unconditionally.
> > > > 
> > > > There are no interdependencies between these patches, so they could be
> > > > picked up individually. But I'd hope that they get picked up all
> > > > together by Corey.
> > 
> > Yeah, I was kind of waiting for more reviews, but this is pretty
> > straightforward.  I've pulled this into my tree.
> 
> These changes are in next since a while but didn't land in Linus tree
> for v6.10-rc1. I intend to send a PR to Greg early next week changing
> platform_driver::remove to match remove_new. If these commits don't make
> it in in time, I'll be so bold and just include the commits from your
> for-next branch in my PR.

I sent them to Linus right after 6.9 dropped, let me resend...

-corey

> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


