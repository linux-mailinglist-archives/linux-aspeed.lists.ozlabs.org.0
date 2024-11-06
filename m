Return-Path: <linux-aspeed+bounces-91-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BCA9BFA4D
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2024 00:42:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkMFg2ytHz2yHs;
	Thu,  7 Nov 2024 10:42:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730936567;
	cv=none; b=hUgsLmRKztrLWQ5mpSQMJJspDmtFtIBoiLBPd7b6C9zdcGT4bONMlckHoi2jk30jdfEulum7Qcg52SwRfw2V9VCiEMLs3DoTyCT2+6TI3O1/5bGC+1xQ/qo4meuuGA+4P+M40DVhaxnCtTxRxs5wJCNDw86WFjcq+X4b1olfWZyTEzDoFA2Mz1jP+bRa91++UeA3cduLQNNWTiNm8V2zAfnistaa5jpafZNe8LzDTamuV7lucxpa8xhzLWVHc0HTF9EwP0NLb9+VqxzZRFW0QMgKtQpGkuMUWLLXIqDuxoJtbZspkyACQSReWrScMyZGE6iazosVJqClfN9nmgCEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730936567; c=relaxed/relaxed;
	bh=RbaXcDiI9VKQ24EWX+KiopF96b7wPeWxBZ4dioG1uoM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ngngZ1GRgtKkD25y4d8nL40eE36819iU1skDTOz2isz/ACPlscTfUP/zB9QyE/tG+2glHrxDKIN6TvKGQOFCgMQGgH1UpzayjwBmhgP1cu4LtsYyXIdaaUdL8SszY7x3V/ycGPdHkIQ5GccXBCHaitjcLXV7nhcQ4MC9h+T297J3la3UYb26kXWeJUYKguUNu6WexYoZl1GGE+0cCyDqy7L6kLV4PuCKMlyTEp44LT3UkR5VtLJ/R/pIaK72xBO3tvgSk70jB5TmUJdkSzqxnkL8Y/cql3SOzJXpO+1+/DQ0e99jxuU9KHv9kgeUZ2EFnwQfc8LMif6zTT2HfFT15A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KS40TnrW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KS40TnrW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkMFf58ygz2xCd
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Nov 2024 10:42:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730936566;
	bh=RbaXcDiI9VKQ24EWX+KiopF96b7wPeWxBZ4dioG1uoM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KS40TnrW8Q4bk1DyTkKfLOstKJyzBhfs5ZulLiWbEpfar7mxzWJ3GXGlcfD+5+93l
	 zr3C+mL+qwB39ZIWNMJEvyFAl6UzFgJ86J39fiM/68WrJQSfXlimFGquBaG+eQKmqS
	 xSYc7YkYYDT2dTzqPpFdCqU1Yb0fbIq2jI7oa5+wsm8V3onLLAtbXQkzTUjLR0D685
	 hwLFYEplpiSWky/Jqv6+gFhqGqxQVDZCiY5hOSO991mliNUYT5BXyu8dev0r3iSLpT
	 LtzmQPPbhvZzhUKiwxWEQLla6BjzFYVPjXdcgSF97fD75+Gq8l3qS6WPrIli+iRsHS
	 WzAC2aVletFAw==
Received: from [192.168.68.112] (203-173-7-89.dyn.iinet.net.au [203.173.7.89])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 780016B4F1;
	Thu,  7 Nov 2024 07:42:45 +0800 (AWST)
Message-ID: <361ed68842698f0f07f01bbd474367908b699bbf.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: catalina: add hdd board cpld ioexp
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai
	 <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Date: Thu, 07 Nov 2024 10:12:45 +1030
In-Reply-To: <20241106-catalina-cpld-ioexp-update-v1-2-3437bcfcb608@gmail.com>
References: 
	<20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
	 <20241106-catalina-cpld-ioexp-update-v1-2-3437bcfcb608@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2024-11-06 at 16:58 +0800, Potin Lai wrote:
> Add HDD board CPLD IO expender based on latest CPLD firmware support.

Can you please be more specific regarding CPLD firmware versions?

Andrew

