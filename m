Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA5426AD8
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Oct 2021 14:31:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQnbn53kSz304w
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Oct 2021 23:31:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=D//G7Nm5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=D//G7Nm5; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQnbj4VKqz2xYS
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Oct 2021 23:30:56 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id y26so39015132lfa.11
 for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Oct 2021 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRAKlrjYZ2BofUUtJkJm2s/J2CZlczhgEJA5Cf239sg=;
 b=D//G7Nm5D/hrsXapqLtyBsXQJIrFSfHEYwpFuC4QcIauYEhE1hQTVnCy0MYKm2+G9g
 LEOF4pQXuHioDeJWVZ4T8AYr+kRD3FhaAZ77spcOGBKychMH0kZNe2SR72/glVYtT4Oe
 /pYov29qlNOI2xR5+9vM0J9RtVK+7Xd+mUn4OXQAxtEsoVLZ2+bJJU9szlyavvHiQVsb
 9GqjDSZW4CciuV+JhnJRRJZ426Uxa/CWUzh2OU0oWRPUmPj1JiM5/J7rzoe9oDt5rkSY
 AqNni6UIpO6oYSQr/b77C0wxZWLVMHW42scG6DEBOJj7viWmuq+ktY2gB3Szyj+YzgHK
 3QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRAKlrjYZ2BofUUtJkJm2s/J2CZlczhgEJA5Cf239sg=;
 b=QBHiQSJ5kFzLbhESsCHQP5/mD5vJKLOJwT6SnlHVBBwQbnno/M1hBksNImgTnNDXgT
 y9l/8vtfSPfEyV/8aO7xmh5eMslNdZIdZVxUcNDC3nnZUNHtVHc7jH/wjlr0nQrBLBjL
 17CcW+cQqM1sqspeBjL07s3gy2bkEcSCMMI42IeYToT3bLaxC34vvTz0DhuLQFH61lMv
 bOCBvoA68HEoI+FMyrGVavcbQUP0HPyO2SYlI+V/lwLVW5XvLuJm7HuSD6/1NoeMX/Tl
 Pupua3Se/PnbQyZtqAt2Xa4r9ClOxSdiQqvWtdxRJzJ0hgbnnnWANbG5cOWLu0RM+mX3
 xCHQ==
X-Gm-Message-State: AOAM533w/vzL5PQaQ6sM08+ZmC4l2RBg3UHsvFflj8IIeZBPJsHy43ai
 uW7nbrRn62wtcCnVLJ4qX+fxq6tSQUt22RFWcPsctw==
X-Google-Smtp-Source: ABdhPJyPpUahdJoHTuIqD2aBGpQuLmCEKQyBmbExfmj95aeYepno5u6hjjoxGbcJ8w1O4ixQqJBlmzqnQoPlp6LuXJQ=
X-Received: by 2002:a05:6512:3502:: with SMTP id
 h2mr9565938lfs.635.1633696249388; 
 Fri, 08 Oct 2021 05:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210909004920.1634322-1-osk@google.com>
 <CACPK8XdM62sratWi7nQ8xukE3CbsMSA7PK7nRH52aU7Niw3jWg@mail.gmail.com>
 <CACPK8XfRUdw3uHNoa+kOKWKAQcttj4nWyX=_Ue2eR0zCJ6fhHw@mail.gmail.com>
 <CABoTLcR=BH=eiY4wULsDd0QJ2NZusSYi57gWuX72wRDq8tvvHw@mail.gmail.com>
 <CACPK8Xe6UbZdB3854Wr_-m+sOE_xM0q5A+Kh=KnO1GvNBEtc4w@mail.gmail.com>
In-Reply-To: <CACPK8Xe6UbZdB3854Wr_-m+sOE_xM0q5A+Kh=KnO1GvNBEtc4w@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Fri, 8 Oct 2021 08:30:32 -0400
Message-ID: <CABoTLcTA0aLN2=+vYG2fyP=VE-mGKe3bZK9L_+XtJ4C3Rg9Abw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add TYAN S7106 BMC machine
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Jason Hargis <jason.hargis@equuscs.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel

> It's now applied to the aspeed tree for v5.16. I made one small fix to
> the makefile, where we expect .dtb but you added .dts.
Argh, I'm sorry for that! Did I miss to run a test that would have
complained about this?

> It will appear in the next linux-next, and in v5.16 once the merge window opens.
Perfect, thank you!


Oskar.
