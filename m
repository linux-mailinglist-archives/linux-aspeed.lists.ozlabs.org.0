Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25011C15F
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 01:30:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YF7z1hxszDqsj
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 11:30:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lP5Q5crX"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YF7h1XsWzDqs8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 11:30:22 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id a17so260013pls.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 16:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98MiLyb51h/Cn9dLTiDsE8vJncDIeF6YECGtn7W0cKg=;
 b=lP5Q5crX7/86Q1Xp9XhlJT2FRQD7zC9MxT79L9+amXZP+PhH3+YyDU+ctYKmPb17dW
 Q2cO/iO/ITwDzdv1X2LTcZl2EBQL0lUpWBssaHesdTeOEJ7ZFWYHQqJRR+tUg4n+Calt
 iNFRm8QOAzdf4KF96xSvwJznLTkB4VYX8ZP3hfFaqjDjBiL6PkseF3kJB/r2Y8gU1TIi
 UlimAMy4UwP96pqrj1AMt5GHymW2cJwEa9U3nOF/qWGj3RAXjQ2hnCRvMWvmtZEvSp5B
 FMpsl4O4HQMYL6cr4l/B9Kizp0uceT4htzL1ROd3IO0a5ZjWDA1skCCReslvqApFuwTR
 6J+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98MiLyb51h/Cn9dLTiDsE8vJncDIeF6YECGtn7W0cKg=;
 b=oD01Bqjs1P9iDPRQmZ+piwTxSXC44LtmJIGB4FA3pGK7Ktz4IXl6U+QmHtOe5etoTo
 1fN3C5N/Y/DXDQ4ibeL0q27KQDRFdNH+4OzL76l7+KKAyV1H6hUYbxNtmIg7uWbaNIFj
 n2E/PKV7+PLC4/7C3v8GtF59ybZHq3a+Txz6UpEgpekEJ4BEx3TYrtSCLjKmDDwrqZML
 gvV9a7LqR985r9LUUzhKk/Z0WYEtDnmptHbyWWOIoF7J4tggmdsvg7BqfjUjvDB69xa0
 pSwJSLZY9/QI5kB75vqUHRioJjDkAERvc0hQV1/h1ugq6AKeQPA0JiVcLup4VaJKhOsv
 hYcQ==
X-Gm-Message-State: APjAAAUGtUSRMAhvLj/TBhfNPjeM3n3fDgDCkELPegeFiK9F7cvn0w93
 OAL0jUxVcdO3sgpfwU6Kx6OnaUXezAmT4zGCFPHzrQ==
X-Google-Smtp-Source: APXvYqzq6Vm4MF0LJmgPetQ0HfLygKQDroi15h3w98cajYBED64kJb4iyOD59iDuYqSx2M7otcQUFs5SP10L1YECnr4=
X-Received: by 2002:a17:902:fe8d:: with SMTP id
 x13mr6600338plm.232.1576110614370; 
 Wed, 11 Dec 2019 16:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-8-brendanhiggins@google.com>
 <CACPK8XctCb9Q2RaFVHEDuWxKDXpCWMWs-+vnKZ=SeTa3xRnT_g@mail.gmail.com>
In-Reply-To: <CACPK8XctCb9Q2RaFVHEDuWxKDXpCWMWs-+vnKZ=SeTa3xRnT_g@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 11 Dec 2019 16:30:03 -0800
Message-ID: <CAFd5g45MFYMK-eZWPC5fhm2OkynUXKfArUVhbanYVH+qKRUwPg@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] fsi: aspeed: add unspecified HAS_IOMEM dependency
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Jeremy Kerr <jk@ozlabs.org>,
 David Gow <davidgow@google.com>, Alistar Popple <alistair@popple.id.au>,
 linux-fsi@lists.ozlabs.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 4:12 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 11 Dec 2019 at 19:28, Brendan Higgins <brendanhiggins@google.com> wrote:
> >
> > Currently CONFIG_FSI_MASTER_ASPEED=y implicitly depends on
> > CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> > the following build error:
> >
> > ld: drivers/fsi/fsi-master-aspeed.o: in function `fsi_master_aspeed_probe':
> > drivers/fsi/fsi-master-aspeed.c:436: undefined reference to `devm_ioremap_resource'
> >
> > Fix the build error by adding the unspecified dependency.
> >
> > Reported-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> Nice. I hit this when attempting to force on CONFIG_COMPILE_TEST in
> order to build some ARM drivers under UM. Do you have plans to fix
> that too?

The only broken configs I found for UML are all listed on the cover
letter of this patch. I think fixing COMPILE_TEST on UM could be
worthwhile. Did you see any brokenness other than what I mentioned on
the cover letter?

> Do you want to get this in a fix for 5.5?

Preferably, yes.

> Acked-by: Joel Stanley <joel@jms.id.au>

Thanks!
