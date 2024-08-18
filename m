Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BB955D24
	for <lists+linux-aspeed@lfdr.de>; Sun, 18 Aug 2024 17:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WmzvL3phjz2xlF
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 01:20:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fhhBAgai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WmzvB2rCXz2xKL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 01:20:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08763CE02BD;
	Sun, 18 Aug 2024 15:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89C4C32786;
	Sun, 18 Aug 2024 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723994433;
	bh=SYQPmG1E8m02rnWoijZ+S3KGw8a8k2/aSB76BCn6A5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhhBAgain3MYzsELAc0HysEUBM2dUI9XIwNOMpfU5LjoYeUOhUoo/lwXXWd6VR0X9
	 j0or6K8fnnxOkW4zZ++DK1eXofeOGbQ9pq+5TotWAQm8qNlqAGq0+4y4Y9nAKPyOa/
	 /alF4T95ZdbICXnwC07Ulnnneiv3VvSMhhFpQg6cT/gotFvLj3pqypzw/r1TzR6UhI
	 68M5eJvTXYcS8M9GC5nlMUp6NvfosxYqTihz4XJr9Nl2rYnOKx5b9Q7x3UdcU66ZAi
	 eX0TlRDTbCuej4WsxiWDRE7JK8cPz3boloQ9sA1DTDMRZqn7HXoAFQ8Q1l+DR+f4hb
	 buPw+RUScjwKw==
Date: Sun, 18 Aug 2024 09:20:30 -0600
From: Rob Herring <robh@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: Add support
 for ASPEED AST27XX INTC
Message-ID: <20240818152030.GA101410-robh@kernel.org>
References: <20240814114106.2809876-1-kevin_chen@aspeedtech.com>
 <20240814114106.2809876-3-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814114106.2809876-3-kevin_chen@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, andrew@codeconstruct.com.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2024 at 07:41:05PM +0800, Kevin Chen wrote:
> The ASPEED AST27XX interrupt controller(INTC) contain second level and
> third level interrupt controller. The third level INTC combines 32 interrupt
> sources into 1 interrupt into parent interrupt controller. The second
> level INTC doing hand shake with third level INTC.

Missing Signed-off-by. checkpatch.pl also reports trailing whitespace.
