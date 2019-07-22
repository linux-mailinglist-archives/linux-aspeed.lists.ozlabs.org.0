Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDAF70A93
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Jul 2019 22:23:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45stNF54W9zDqWN
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2019 06:23:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="A3UBj/Oy"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45stN72tVszDqVc
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2019 06:23:18 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id j5so72714745ioj.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Jul 2019 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xh7VZmkbjwrBgayZ7b6xtD8WVEMS58rBjXLVPr4+QKE=;
 b=A3UBj/OyBJI/LYvN4Fbj2VbsI0NL07wC8qJGMNrKr9ob9nG3Ra36iFQwW3TU33Blux
 j3uAhD/lAp75l/WK7ILT8TM/o8BVuSH0w98G86pJT77QPCE1syd2o4Kg3zfHdlLIaHAZ
 /TN/V7KnoWIerNT6AaF+4n7LQHjxnsfpwnn8AGC6hiMLvgqwpVfornpWuvQwZ11zTriN
 CVR5fBmmoVyydoVA0SSSmzR2iANHprSMQnwwX4S+7wgUyT/FDAZRLLSWoIPMufTCmpza
 12n6HyAQUN27O8cHaWfYxK0KZS/5KrbT9p9cjTTF2IGxSL/Sj6bf4PHgDekr8i8Y0krI
 aQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xh7VZmkbjwrBgayZ7b6xtD8WVEMS58rBjXLVPr4+QKE=;
 b=r/XMpDOIV84b2wF1ia2hjdnJLytHrfVx7KMcqCHN18/ia0us6JMoD/4v2A2n8qdg9n
 YWRz8W4ct98Jg1LFnFa+xn7xkctJVSlT6ZXlKev8woTg8CAKqNZsFhgL9PCtJQ7+jY3U
 Ku2BCsga+5woUoSSnaXefPfkFU14xYATCn1QVSttrF+63v3rIBPrMrUQ6h5XHUerLbWY
 iA7IA6SEO+RX2VDefaa2eclAzyjIoV/kY1dBsFtYLDX7uXXOtPUjIx+sFiUfbeiV0+4o
 UkGrtnoeUudElV/dki7H5oDVYv4r4LeKccE8qFEkEH76NCoetosJB8UqpKXDB2Ny/0wB
 4IpA==
X-Gm-Message-State: APjAAAW3iTXcNe8Gy3sBYNK0llI9Ui9WyPZCFV260y45Anhouli4CkE8
 DvQdbXTx0EdTk3WQOdUm+9ZF6dTFl6FJZYLpr5Y=
X-Google-Smtp-Source: APXvYqxJpepQ9VQoAAc07ujRiGJYpdX3gf8KpVTLJVLZzcSeVsr0TxUgUDnv1zP688nUQIe9u44KNb4m+xHpj3P0O5k=
X-Received: by 2002:a6b:ee15:: with SMTP id i21mr33273959ioh.281.1563826995537; 
 Mon, 22 Jul 2019 13:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190719203037.11795-1-mspinler@linux.ibm.com>
In-Reply-To: <20190719203037.11795-1-mspinler@linux.ibm.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 22 Jul 2019 13:23:04 -0700
Message-ID: <CAOesGMhf984ic0O4zhNGo=SfrqDX2wDkYxyfga81JDXkUyciqw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: swift: Fix FSI GPIOs
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2019 at 1:31 PM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
> From: Matt Spinler <spinler@us.ibm.com>
>
> Change the FSI clock and data GPIOs to match what the hardware turned
> out to use.
>
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>

Hi,

This is not a comment on this patch specifically, just an overall
request for people to adjust how they post patches:

When running get_maintainer.pl on
arch/arm/boot/dts/aspeed-bmc-opp-swift.dts, I get the following:

[...]
linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
[...]

Please include both of them on patches. Lots of people aren't
subscribed to the aspeed-only mailing list, so coming back later to
reply to a patch is hard when it hasn't made it into your mailboxes.


Thanks!

-Olof
