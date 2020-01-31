Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B114E7A8
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2020 04:44:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48834V2p9nzDqdV
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2020 14:44:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Jf3jwIJN; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48834D1NjLzDqcY;
 Fri, 31 Jan 2020 14:44:11 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id q15so5247457qke.9;
 Thu, 30 Jan 2020 19:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gnZ43qN7S1q4zZHme5V7oQ52yf1PnubAtyieKw4/fVY=;
 b=Jf3jwIJN6NmDEE5rHTH3bi4JBCItLuv4Z8GzrYcknpWQQ5kCZURSEcOUtxHYCcQ5eK
 rCg0uTFwevnnkGt785cjEtT+QPDAOFP1a5TzYfTETRSjUDZskAM/97VoZYjWatRYnYQz
 c7f6jh9skAy62+AXe7jyQE/Y6J/IYqqaExXZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gnZ43qN7S1q4zZHme5V7oQ52yf1PnubAtyieKw4/fVY=;
 b=LAu6XYfAs7fSmkpjdH+cS+5j04yhYTovweUWL7ubLYd7Qdt9QDfMoIJT1/UqzXyH0y
 TezqysigfJwjSJkCjlafUk94uPYuGRqLpW8k2P/McNy8fg77kFwMBEaFQhxwzT4Yrnxk
 tfJn/Lc4BaAiW4yt6m8qCjrTWJAA8ErlwqnD0TJSd/EXnte+kr74rszUUPQgqhCyTzWD
 j81RpXIIVm0/ga5lml+5wiWXkVW/4g1BXAsFhHPe4cH4Qx/0idYsQLUBsn7/VazjaeMa
 CC5KGCIq3PMj6rUwJUhhPObo+3i9BsEAU7tgFkgx8P2bdsfapTPdvwA9S0jtxCj3U1IJ
 XApQ==
X-Gm-Message-State: APjAAAXODjS3CeigUnIEvSLv1S4vZbeiyGTMuQefc/m2Droh/MzIxvb7
 sgqtao5sWq98nTYMqtIgkdxcu0AruOLZYVt1TNI=
X-Google-Smtp-Source: APXvYqwD62nlQsAFr4t2VRsUvR/xF3QgSUs3f8+MA8JJi/UqziVen3riJEm4PChAbEVcrDuYZozUpVA7fDtvclfVkKg=
X-Received: by 2002:a37:d14:: with SMTP id 20mr8922868qkn.330.1580442248103;
 Thu, 30 Jan 2020 19:44:08 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-8-brendanhiggins@google.com>
 <CACPK8XctCb9Q2RaFVHEDuWxKDXpCWMWs-+vnKZ=SeTa3xRnT_g@mail.gmail.com>
 <CAFd5g45MFYMK-eZWPC5fhm2OkynUXKfArUVhbanYVH+qKRUwPg@mail.gmail.com>
 <CAFd5g454tX9zxRAq5T_pDGzcWt7u5r119wjo-BCGVq+=Ej4bGQ@mail.gmail.com>
In-Reply-To: <CAFd5g454tX9zxRAq5T_pDGzcWt7u5r119wjo-BCGVq+=Ej4bGQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Jan 2020 03:43:56 +0000
Message-ID: <CACPK8XddCV6QnvRSS7WcyoN7W3yuUSbyT67on=EMhV7jWDExUg@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] fsi: aspeed: add unspecified HAS_IOMEM dependency
To: Brendan Higgins <brendanhiggins@google.com>
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

On Mon, 27 Jan 2020 at 09:46, Brendan Higgins <brendanhiggins@google.com> wrote:

> > > Do you want to get this in a fix for 5.5?
> >
> > Preferably, yes.
> >
> > > Acked-by: Joel Stanley <joel@jms.id.au>
>
> Hey, I know I owe you a reply about debugging your kunitconfig (I'll
> try to get to that this week); nevertheless, it looks like this patch
> didn't make it into 5.5. Can you make sure it gets into 5.6? It
> shouldn't depend on anything else.

Sure, thanks for the reminder.

Cheers,

Joel
