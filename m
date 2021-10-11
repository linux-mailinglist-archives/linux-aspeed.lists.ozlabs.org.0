Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D0B428617
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Oct 2021 07:04:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRYT6fypz2yQm
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Oct 2021 16:04:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=S9AOUkYV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=S9AOUkYV; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSRYP0Mdkz2yHy
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Oct 2021 16:04:40 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id y11so1631697qtn.13
 for <linux-aspeed@lists.ozlabs.org>; Sun, 10 Oct 2021 22:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JM2/g+wiSa96pWuOjZqnj9S3CS1Zh/nkB9GUQjcwpu4=;
 b=S9AOUkYVxpOGUHu1R7JALtsGcIcr0XO7sDf4KoxEAn/9bylu3vbF2C5v23PLTeyMg5
 ZQt3ZjIs58qN4kNMymNqlopfN2zerg/XQKBVD3g1Kp9Er6KcFcKCb7izR/yR/5gYl9Q1
 CfGuQuEqo/K1tG1CXF182pTqqCOKdwPakRpjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JM2/g+wiSa96pWuOjZqnj9S3CS1Zh/nkB9GUQjcwpu4=;
 b=KpM7WYLFaq/wuSLcaXrdYS0oBw9aPlrNdw9Hs3MB4xTMI6ZL3YJZjuSEzQUPitdUmP
 T3I0D37xi24sjyXWyG4OHaCLDIAbLaaq0tR6eko6t1xvk8g8E/LEYWxnJyg72mnUX0p6
 UrsAEhmfeN9omL9k2oyqhh4sWAWi6F26HtdtmMH92E4sh46ZWNoTQmFIjDp1nRjXjzOy
 vm7EIUphyJSY94LLRPfMpBZoaiATh8wyEZrGcX42aXgP+AjHCEgvhQ/EgWYyMOJjFOJZ
 9EMI1RDiH6abVFWUqrS+ZvYhd21rO9MRWithz+W+yML7qPy21Tsw0ZgT3ArGxLBCmxcS
 RWTQ==
X-Gm-Message-State: AOAM530IW2W7Qm6p0J8puasKmOqlUU2VBPKyJ6YIsXs732WEkJqcUcQq
 lGa3TJFd/DBXJvsrctibezSVVgwVLDTRNR/zVOc=
X-Google-Smtp-Source: ABdhPJzmMb3MRWjO9WyaukJDG1RuyRzUuZzb2zAsqm+u7pkvltIp8duGy3dGcGoxX/B53I85DqkdfsXYXHaZ/qu61fI=
X-Received: by 2002:ac8:1107:: with SMTP id c7mr12441749qtj.392.1633928676445; 
 Sun, 10 Oct 2021 22:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210909004920.1634322-1-osk@google.com>
 <CACPK8XdM62sratWi7nQ8xukE3CbsMSA7PK7nRH52aU7Niw3jWg@mail.gmail.com>
 <CACPK8XfRUdw3uHNoa+kOKWKAQcttj4nWyX=_Ue2eR0zCJ6fhHw@mail.gmail.com>
 <CABoTLcR=BH=eiY4wULsDd0QJ2NZusSYi57gWuX72wRDq8tvvHw@mail.gmail.com>
 <CACPK8Xe6UbZdB3854Wr_-m+sOE_xM0q5A+Kh=KnO1GvNBEtc4w@mail.gmail.com>
 <CABoTLcTpZymAD0RNv9nHV8PeFniMWG=Yo9-csyn7hjdaTqoLUg@mail.gmail.com>
In-Reply-To: <CABoTLcTpZymAD0RNv9nHV8PeFniMWG=Yo9-csyn7hjdaTqoLUg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Oct 2021 05:04:24 +0000
Message-ID: <CACPK8XfMPhTDHjxS21K8+64skE5e5OSevt-i5V=KiRWmgKEAoQ@mail.gmail.com>
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

On Mon, 11 Oct 2021 at 01:33, Oskar Senft <osk@google.com> wrote:
>
> > It's now applied to the aspeed tree for v5.16.
> Thank you! Just in case and since I just looked for it for a bit: The
> "aspeed tree" now seems to be
> https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git/.

Yes, I changed that a while back as I thought I'd start doing combined
aspeed and nuvoton pull requests. I haven't done a nuvoton one since
(no one using those devices seems to want to use them with upstream
kernels), so perhaps I could go back to using just the aspeed tree.
