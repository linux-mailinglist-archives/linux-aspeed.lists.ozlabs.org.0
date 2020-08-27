Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C7253DB2
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Aug 2020 08:27:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcXp6214zzDqY6
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Aug 2020 16:27:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcXnm3ClCzDq5t
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Aug 2020 16:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=sYG/O8pK; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcXnj6RYlz9sRK;
 Thu, 27 Aug 2020 16:27:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1598509627; bh=0jnmw3HItILjj9al39tdUW1/oczaOCF9us3o3EFIRyE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=sYG/O8pKqds8ULQ32y2auj0Zciks1xfx3dVbQeRTF7cjRTkoSIt1zXXstER+ujk6a
 TmlvFvJLcUp/AthOhwI63LKUOZ7Z4c9KjCqCAzx5EXXjYisZrCbCxLm7opDRwyydol
 jz3awI+osTZzEzcDSO34es+ULJ3tNylQXHZBH9i6zGKh+BjVvUCrqZxezP1y7FlObA
 6AZgRQXoGoRuiMRQefnnknFjYKV/KcPi41Y9DlyxBesT0YV6t8h+LCtnPVp+85eAP9
 l5w1VZSJTKATH3C9+ZZxG5Rnkcd7aFHJpob7FekhwGO1F6uIFthS0arUnbhvWECEkU
 p+vJp0SSpEf7w==
Message-ID: <1e56af7945b93a22e31ba6d81da82cbdb1b237b6.camel@ozlabs.org>
Subject: Re: [PATCH] ARM: aspeed: g5: Do not set sirq polarity
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Oskar Senft <osk@google.com>
Date: Thu, 27 Aug 2020 14:27:02 +0800
In-Reply-To: <20200812112400.2406734-1-joel@jms.id.au>
References: <20200812112400.2406734-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

> A feature was added to the aspeed vuart driver to configure the vuart
> interrupt (sirq) polarity according to the LPC/eSPI strapping register.
> 
> Systems that depend on a active low behaviour (sirq_polarity set to 0)
> such as OpenPower boxes also use LPC, so this relationship does not
> hold.
> 
> The property was added for a Tyan S7106 system which is not supported
> in the kernel tree. Should this or other systems wish to use this
> feature of the driver they should add it to the machine specific device
> tree.
> 
> Fixes: c791fc76bc72 ("arm: dts: aspeed: Add vuart aspeed,sirq-polarity-sense...")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joel Stanley <joel@jms.id.au>

LGTM. I've tested this on the s2600st, which is strapped for eSPI. All
good there too, as expected.

Tested-by: Jeremy Kerr <jk@ozlabs.org>

and/or:

Reviewed-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

