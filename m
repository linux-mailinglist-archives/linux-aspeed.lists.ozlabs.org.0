Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB8428616
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Oct 2021 06:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRPB5LSrz2yWH
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Oct 2021 15:57:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=R6NpWUNJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=R6NpWUNJ; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSRP35rl8z2xt7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Oct 2021 15:57:25 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id r16so15349901qtw.11
 for <linux-aspeed@lists.ozlabs.org>; Sun, 10 Oct 2021 21:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WWpyeY0imQnYbcHpzPvKUUqYXHGa7q2AUzbQow9xU4A=;
 b=R6NpWUNJdTEd4DxOOAcNo18K8N0/2QYfeAPdk6ztRDdnCktse5/Wrclx+map9gobwH
 YNQQOYVNcPA0c8K/pG4hADdbiyeAk3B+5Z+W7rSYmmj99GO1rXzndu+2CLv1LgckxQGq
 +TMRnRBn94QyYrfJCnZPVgIpXxHnUxD+VBNWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WWpyeY0imQnYbcHpzPvKUUqYXHGa7q2AUzbQow9xU4A=;
 b=ltSfdizwP5VayXrWjLzIBB+ZZJGsAYDAusEBwvFT9NwUK8GTFuwyoa7fE5RV6KG5Gq
 3o0JQf1B18ZXXy7Qjt0biVb1Cf5SIgker7DU3HPqSRYhKSRWPQukJsBge6/hxHV1mZ77
 iycY7VZHHc1IencTUmwbqIGvDTzF6F97H021MUukSP/IDeiu+oi4t3o6+5Nw/3JkJskP
 kjX+19YVc+SeJNkn2WI4Xmm0Y2L4q73Rq/Um7XE3tOs9Zk6+kq611ANwoKQPIaS1efOf
 l6ep8Bw7ATv4DPdmQ+Ol8NpnWS/XidacvgtZNp+UKyOFMQ4mBE4wtb8b3VA7I0KemRtS
 Xp7g==
X-Gm-Message-State: AOAM532d5u8YTC+DASLSw5gAAQgYBfqxvO6guI4+wrk/pV027ZaN/feR
 29IW84UUbcv5FCLCMs24dipFCY0SnqoaAX9hgzo=
X-Google-Smtp-Source: ABdhPJwen9X93rTnYbLDcje0cQCaocJ9HEVgWapJpGxqCcYotnqYUChCHDhTztxFNLq0d0z9GkwIMdJTvUlvqglf2vA=
X-Received: by 2002:ac8:1107:: with SMTP id c7mr12417100qtj.392.1633928241754; 
 Sun, 10 Oct 2021 21:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210909004920.1634322-1-osk@google.com>
 <CACPK8XdM62sratWi7nQ8xukE3CbsMSA7PK7nRH52aU7Niw3jWg@mail.gmail.com>
 <CACPK8XfRUdw3uHNoa+kOKWKAQcttj4nWyX=_Ue2eR0zCJ6fhHw@mail.gmail.com>
 <CABoTLcR=BH=eiY4wULsDd0QJ2NZusSYi57gWuX72wRDq8tvvHw@mail.gmail.com>
 <CACPK8Xe6UbZdB3854Wr_-m+sOE_xM0q5A+Kh=KnO1GvNBEtc4w@mail.gmail.com>
 <CABoTLcTA0aLN2=+vYG2fyP=VE-mGKe3bZK9L_+XtJ4C3Rg9Abw@mail.gmail.com>
In-Reply-To: <CABoTLcTA0aLN2=+vYG2fyP=VE-mGKe3bZK9L_+XtJ4C3Rg9Abw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Oct 2021 04:57:09 +0000
Message-ID: <CACPK8XegMW2FoBs8X4at+aSm42vqyp5KFAUW+Yfp6So-x7uYDw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add TYAN S7106 BMC machine
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Jason Hargis <jason.hargis@equuscs.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 8 Oct 2021 at 12:30, Oskar Senft <osk@google.com> wrote:
>
> Hi Joel
>
> > It's now applied to the aspeed tree for v5.16. I made one small fix to
> > the makefile, where we expect .dtb but you added .dts.
> Argh, I'm sorry for that! Did I miss to run a test that would have
> complained about this?

Unfortunately it fails silently.

You could have cleaned your object tree and checked that the dts was
built into a dtb when running "make" (ie, the default rule without
specifying what to build).
