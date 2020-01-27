Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A114A120
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jan 2020 10:47:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485lJf0K5xzDqJT
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jan 2020 20:46:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TpYJh/ex; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485lJQ4D6jzDqHV
 for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jan 2020 20:46:40 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 2so4645107pfg.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jan 2020 01:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Cm7Q5qzKRSI5iiYtrFdNoM+jC44DmDk+4BVP7MJ9Zg=;
 b=TpYJh/exjltRCH5MaUqukcoU35cpYu4IuEiuVHoJprcgTTXo9U/FcLTjUK/nXQ3fDz
 6559/RJgNO0g3sLmU+rHSiUR2HGYTwLDvjiGdRTnxdtyP2X3wc5drkyP6dwwcCk40WaZ
 6Aey153QXTKHD/rXHU/kUZAkaWOsT8oaXxg71fAYko/Fo+knlW8ZewVpbEKF8HYuSmTO
 zDK/nhC3bVFz8H2ttpc7x42Qvp9pPqv/Zy9+PGPN0tEpCWa1bZEUpjUxKt3SmW7UF6B1
 PPl9+f2dfb/Z18xZgVEsR0SG74VwlPqgLnTECYbn949Aa84mw037tsNGH+QpGwX6UX+a
 /TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Cm7Q5qzKRSI5iiYtrFdNoM+jC44DmDk+4BVP7MJ9Zg=;
 b=JtyGKU5fW82vwVo6/caqD43XqfXvhHuE9gNMnc/EuX3tDxMwIt+mfesT0o61EwINZK
 1hLfTmg+tB3IAJKc4eUBNp6QJflJNBeggCHhiZnObVV2g3Ec1EV+a4ifcVM0lJB10Xrn
 vzftacK4Ie2MI04Em6nLJ2JcoUaZzwLRAprpkEw5+A+JqMcRUxx94onmr7IgiAYPdHXE
 p2A8pjqQU+qhsfNW/dn9xl0hG7NtBLLccb+oIlrnBprgVkwyPhDSibnvRyUJmwaOAWto
 P9rtSmc3GcJlFXZ55rSOlzeBwUBoOnKrtqjXwxlTrCWxDEU4pO/xQcUBxa/BSqE8WKpj
 bhtA==
X-Gm-Message-State: APjAAAWcMeqKAGQkiLeOzCCw1Eb/0Khxm0p89jfR3kxX0bcUKhqqEFJv
 Dxz/mk/KZCyPbR7KMhMZU2KyztWtSAQsBZt37mR8Qg==
X-Google-Smtp-Source: APXvYqzxAmZHmgdppWLSwzJ8z6LS1RNMsDSWdXzZNhIxbL6muJXHr3snth4+9kFim+A0KHQR+fGA6ETjYsUICdwc1Rg=
X-Received: by 2002:a63:480f:: with SMTP id v15mr18178906pga.201.1580118396834; 
 Mon, 27 Jan 2020 01:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-8-brendanhiggins@google.com>
 <CACPK8XctCb9Q2RaFVHEDuWxKDXpCWMWs-+vnKZ=SeTa3xRnT_g@mail.gmail.com>
 <CAFd5g45MFYMK-eZWPC5fhm2OkynUXKfArUVhbanYVH+qKRUwPg@mail.gmail.com>
In-Reply-To: <CAFd5g45MFYMK-eZWPC5fhm2OkynUXKfArUVhbanYVH+qKRUwPg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 27 Jan 2020 01:46:25 -0800
Message-ID: <CAFd5g454tX9zxRAq5T_pDGzcWt7u5r119wjo-BCGVq+=Ej4bGQ@mail.gmail.com>
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

On Wed, Dec 11, 2019 at 4:30 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Wed, Dec 11, 2019 at 4:12 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 11 Dec 2019 at 19:28, Brendan Higgins <brendanhiggins@google.com> wrote:
> > >
> > > Currently CONFIG_FSI_MASTER_ASPEED=y implicitly depends on
> > > CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> > > the following build error:
> > >
> > > ld: drivers/fsi/fsi-master-aspeed.o: in function `fsi_master_aspeed_probe':
> > > drivers/fsi/fsi-master-aspeed.c:436: undefined reference to `devm_ioremap_resource'
> > >
> > > Fix the build error by adding the unspecified dependency.
> > >
> > > Reported-by: Brendan Higgins <brendanhiggins@google.com>
> > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> >
> > Nice. I hit this when attempting to force on CONFIG_COMPILE_TEST in
> > order to build some ARM drivers under UM. Do you have plans to fix
> > that too?
>
> The only broken configs I found for UML are all listed on the cover
> letter of this patch. I think fixing COMPILE_TEST on UM could be
> worthwhile. Did you see any brokenness other than what I mentioned on
> the cover letter?
>
> > Do you want to get this in a fix for 5.5?
>
> Preferably, yes.
>
> > Acked-by: Joel Stanley <joel@jms.id.au>

Hey, I know I owe you a reply about debugging your kunitconfig (I'll
try to get to that this week); nevertheless, it looks like this patch
didn't make it into 5.5. Can you make sure it gets into 5.6? It
shouldn't depend on anything else.

Cheers
