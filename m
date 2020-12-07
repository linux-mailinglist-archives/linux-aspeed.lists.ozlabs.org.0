Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0EA2D0FC0
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 12:54:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqMDB21V5zDqX0
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 22:54:18 +1100 (AEDT)
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
 header.s=google header.b=SC5cS/hN; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqMD046KbzDqNJ
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Dec 2020 22:54:07 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id 19so4599185qkm.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Dec 2020 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E49RW3lCYWJrRHYIOf8r6xoeeHtbQpoKE5fOTw71iZo=;
 b=SC5cS/hNjMqFSJGp92Czw/Dl4zANswBGyHPMn5sBorqcFfd0xp1WUId65rkdpnvgLJ
 UDGS4ehZm7nOxE18JRAjnm9uEFr6RdW0SDIcLWxdOcXs74MieegRUh14FNN0eumwNwv3
 hwNslglXh0I/5vN4zRprw8EjNoLnjYVS1/vP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E49RW3lCYWJrRHYIOf8r6xoeeHtbQpoKE5fOTw71iZo=;
 b=lhZuAK6NwvVni7gAC2mjDJK2rw5FTgdWAvthuyxjeNhilMIYEIpkaj9HEzyTn0JvV3
 2rmhrzcFIj6afWjSxQjhdK1VUQ6QkKT5v+zRqAtCvcY1BOGA2vjRQjwP5X3JE4GBTRFa
 nwTD8W7/R7pjsTucZ7/jK5pE0wcj2RttvFnaOyFRk8jmL8T87+Qtf+VeJc1wZ1oUCo/Q
 YVPgvb/EdvdMm7iKjcMLfJntxkDRTzj2f3wmrTx5goAVA0420u+u/6Vc931Q5f9/m4bT
 F2YE0QPsNhmCp3tVWaMZf1IZxzl+I5UsbDNVw8bzwUSrvYnVma9avbtWrBkWagSj22Kk
 FUXw==
X-Gm-Message-State: AOAM5325rfWDXsCQf1yTDIEG+AGlIcEO2itV/YlWLPyO/Qd1QEnLfAoK
 zy/Zv0ip6ZbDm4K9fBKKEjTtfD6+yMhjZUKC6sI=
X-Google-Smtp-Source: ABdhPJwMVIarKWFTAT6CPBVIaqd6FKPGstN2lTEsLyCRkC4SMh9VXx5/1AbJYFRigDi1UcqIgH0/ixKSkql6qwp0Tho=
X-Received: by 2002:a05:620a:2101:: with SMTP id
 l1mr3530842qkl.55.1607342043919; 
 Mon, 07 Dec 2020 03:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20201207090013.14145-1-troy_lee@aspeedtech.com>
 <20201207090013.14145-3-troy_lee@aspeedtech.com>
In-Reply-To: <20201207090013.14145-3-troy_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Dec 2020 11:53:51 +0000
Message-ID: <CACPK8Xdo1Ove0Gysd6g6ke9rk2QED4kCjxKEAdSV9SbbFkViVg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] edac: Supporting AST2400 and AST2600 edac driver
To: Troy Lee <troy_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>,
 Robert Richter <rric@kernel.org>, James Morse <james.morse@arm.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, leetroy@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Stefan Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 7 Dec 2020 at 09:01, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Adding AST2400 and AST2600 edac driver support.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
