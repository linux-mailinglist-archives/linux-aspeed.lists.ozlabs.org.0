Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3015A433EFF
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Oct 2021 21:07:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYjtJ5SZSz3bP6
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Oct 2021 06:07:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lv4ZuE2d;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lv4ZuE2d; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYjt83Hm7z2ypT;
 Wed, 20 Oct 2021 06:07:28 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A4D76101A;
 Tue, 19 Oct 2021 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634670445;
 bh=HaUgFa7ZDveIyObp/cXpK7mjo1xVVWIUnROJaQjyCDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lv4ZuE2dNjZ7BhmzM/CwPcZ1HTJZ0DpCuwSRiGqEfX9gBxoo3yXHirGGg34++hx54
 VL5nIzqRGK+AmEcTwDp9sr+jn/dlNSjjaA3RMXtl16t0rzryHftQHAGSX0D74ktK4D
 cdF0AQAyStQHXno4+ecCMwMW7sgWDyVfW7PGc1U6f9k3pAPpAUJEjPYYCSZkyn36SK
 jwxSvhlZljt0fO4urkF7uZFVkJ2DHpaFt5qCo26PX2RlEiAfjgH/nNlE3AnlyRZLgX
 Aa7qD2G0M8HK1evEUL4qHTMkIMuiCpqoAZrURiZ2G6txLyOKIL+mxkrihNlmiz2BDN
 VMkYKI+Zbz5KQ==
Date: Tue, 19 Oct 2021 12:07:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v2] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211019120724.50776b81@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211019144127.GA12978@gmail.com>
References: <20211019144127.GA12978@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: sdasari@fb.com, linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 19 Oct 2021 20:11:27 +0530 Kumar Thangavel wrote:
> +	payload = ALIGN(nca->payload, 4)

This is missing a semicolon.
