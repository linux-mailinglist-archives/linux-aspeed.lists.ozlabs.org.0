Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316233883A5
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 May 2021 02:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlCy20tWNz309F
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 May 2021 10:13:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vvBSqOjC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vvBSqOjC; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlCx91r6Kz306K
 for <linux-aspeed@lists.ozlabs.org>; Wed, 19 May 2021 10:12:27 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id v8so11372116lft.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 18 May 2021 17:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QkFJB+otnmwltLGFDsGxwuEk5BhOyR7tWdo4yOWY1wc=;
 b=vvBSqOjC78aj5fWRQSsZoFhAPgjyKXreaLn2qc0ueH0m+gryUOA27w2Z+SpYbsW+AP
 wK9J8Qugui3AbS4s0k85oG0VOb5+yNdNc22hkAcg9x9RQIzaoaP8m7j8eAYTrEC/GG+p
 YZMWkAW4B95iGlH2UkU2TftwyCks9Lr6EexgrQWQQLOGdn1LqflzAxDqxSGWQfEItNau
 AgrUm9ex+QWTrpjXbk80zgpFBlCIMYxEsfEhwVXv4sS34SGhO21Y/L17k5N2VhlNdUSo
 UN43A4PQEiEPxbuA/RMexrA9PtL+9lEKgrI5RUcBJoTuA86MdeqX5CtAGoErWgTaBXso
 9mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QkFJB+otnmwltLGFDsGxwuEk5BhOyR7tWdo4yOWY1wc=;
 b=Qe6lHUKWlDest6fjklVFTbucXGgI0PneLuTk2weK2udJyqVVJCGWP+pvXLYtEzDU+p
 bJfs29MR2xrYjJIePyCnu4RjGdyhWY7FME7dNMFOb7kHXVqA8uyiI1uHquECR2T85AqT
 IcqN5xnCALkInEQFzQNCpKGMXLuoGhA9U5Z88pQTV9adz8qnq3Jxt3MBcf4mgjpo3eIv
 i10H/X2VJqiIlAPZwEN94QxRYoJK5lODfjjJ9xf+7VS89CpobvJlY3qy/R+TzJYMs+oh
 JS3YxZalz5aadqglmD3kTtU8fIv4/paUQepSAqkvf83geg2Hrk8kFfOwxEhJXqeQlRZ/
 NXyQ==
X-Gm-Message-State: AOAM531BlF6WBrcp9VZFmAtnTNw2I/UckYROYvkP25QEDKGxPXN6q7pd
 EghyIv9gmmw53bkpBnE7PlhYfb8MthitCRvyBd8lbw==
X-Google-Smtp-Source: ABdhPJy4FzN7hFkVlARsIv205HJnTPbWVjj0FRfYHskNGYlGD2BX2/SZGDwbbYLTxXAevIsKhZJd4qstb4GB0eWfjr8=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr3450917lfd.529.1621383141079; 
 Tue, 18 May 2021 17:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 May 2021 02:12:10 +0200
Message-ID: <CACRpkdb+3MjbtFvo3t-hX9uDDTdnPQx-KfZAqQUrvQQQ42mqKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix minor documentation error
To: Souptick Joarder <jrdr.linux@gmail.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Apr 25, 2021 at 2:26 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:

> Kernel test robot throws below warning ->

Patch applied for fixes!

Yours,
Linus Walleij
