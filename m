Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2DD4284C8
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Oct 2021 03:33:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSLsy1y07z2yXb
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Oct 2021 12:33:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QfVVNzov;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=QfVVNzov; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSLsp3RQGz2yJF
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Oct 2021 12:33:32 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id i24so65106987lfj.13
 for <linux-aspeed@lists.ozlabs.org>; Sun, 10 Oct 2021 18:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cK6qhGrPgLBA6Z/RtRCe9LwfN/L/EQdDJhwt2ch7cGk=;
 b=QfVVNzovcnUQeGpXUANoys7R15+3zSgIJ8ZqWfhxOQIUwe9GnoX2XjFlm+4GabVRp7
 3jI9t++gxDOZ3+8xdeG3NNgCjye9aEZgHa1xjiznkxLHUQutDlDMd88kUB9ul7DcDWej
 5G+B9hzMuqGevzhiTgyXHNJHK49QP/3/fIuWFACd2Z84tSRckg+XJctvpdOAJxh8Iqix
 OmQCXPib0GqfZszfHzU7qbsiwKtH1oguwizmUsh5svEmiqJZovzvTM/5v4X9241t8Fsk
 lNPNt7S/nOicKCoqxTFPeribppTkonDhD2gPU8ELwKEmUrZTZulagVbtf/+89l46Suye
 V+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cK6qhGrPgLBA6Z/RtRCe9LwfN/L/EQdDJhwt2ch7cGk=;
 b=5PTkIjVf+q0l17TbdXnIZtO6bA5NiOpNNlZ9oPRQ48mQNl8Y8KSu/wuEk061OIneR/
 PZcuZRtoRzySUyfk0PJ076Cl+L/XGEWAvZTNmGNLGDyLHaevuvBnYD/1EFYtbfcuTmrm
 Ac+wQqIQBqD6WQIswMYsJt7hT19AnAZmj8jalV2v1N+HZ2aUG8xussyaLFDMQ1bHkKJU
 0vKtBLTAoHBdMSq0Z0Ne7NB739f49EjRfWG+yR+7rcAVxpTQzaYmF/bUwZxHm6dlDzGf
 4+FpfHmlHR5TapuPlyxipc7DKyVJTtInFWrjkcidlbKiqTCsyg26mTdEiAk3mX48FimP
 GJig==
X-Gm-Message-State: AOAM5305MjVRojjU6EqLf3nrIZflx9TZhY7MUhInzXNfNPqV1AQvOoxI
 6CWJj5Ouyh5Lb1iHFlYf38Zw9TrUAvbYATjOhTttOSZ1zzU=
X-Google-Smtp-Source: ABdhPJyPAgYDvVgNU3RKh7irahEOcjE+rqo1w8Gqpq8o5y1wicDfGOv5k9/bbFAlGrAeyCoDKnWU/Y3kAKpgl8tTNEg=
X-Received: by 2002:a05:6512:118a:: with SMTP id
 g10mr25720116lfr.206.1633916004260; 
 Sun, 10 Oct 2021 18:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210909004920.1634322-1-osk@google.com>
 <CACPK8XdM62sratWi7nQ8xukE3CbsMSA7PK7nRH52aU7Niw3jWg@mail.gmail.com>
 <CACPK8XfRUdw3uHNoa+kOKWKAQcttj4nWyX=_Ue2eR0zCJ6fhHw@mail.gmail.com>
 <CABoTLcR=BH=eiY4wULsDd0QJ2NZusSYi57gWuX72wRDq8tvvHw@mail.gmail.com>
 <CACPK8Xe6UbZdB3854Wr_-m+sOE_xM0q5A+Kh=KnO1GvNBEtc4w@mail.gmail.com>
In-Reply-To: <CACPK8Xe6UbZdB3854Wr_-m+sOE_xM0q5A+Kh=KnO1GvNBEtc4w@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Sun, 10 Oct 2021 21:33:08 -0400
Message-ID: <CABoTLcTpZymAD0RNv9nHV8PeFniMWG=Yo9-csyn7hjdaTqoLUg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add TYAN S7106 BMC machine
To: linux-aspeed <linux-aspeed@lists.ozlabs.org>
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
Cc: Ed Tanous <ed@tanous.net>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Jason Hargis <jason.hargis@equuscs.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> It's now applied to the aspeed tree for v5.16.
Thank you! Just in case and since I just looked for it for a bit: The
"aspeed tree" now seems to be
https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git/.


Oskar.
