Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A068D8431B0
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 01:12:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rdjxNWNV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPjCQ3nDnz3bsr
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 11:12:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPjCC6JcLz30GC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 11:12:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZUu41NIy1go0/WlVvM2jE8yEu9KhVGZIlw10YLiU/wY=; b=rdjxNWNVvuMp7Dmxu3W5l2C6BA
	/YB0Cvf8+ETvJfkSgHCZ1T7HAJtN19VT+sAv2UWv9rw8KXeWTtIpa6FDYhFpDGOSnRP8M2nf254O/
	S8tVjHO59MmBufpzYO52ZYslGjmslX+/nCj7HOMbTdedBr6AAAI/QOviTqVmS6qIyQanWyJ5HHLWa
	02+IBQfpfg8ThqEZYSuvXWab/Ezvsr220iLYP6q9AhXGpz0ZEpqAMWZ7FepsxY/TEsjelwgPQqG6k
	DAC8CHlFiNP0MRXrST0eywfT9OO23BpH0AWOpZg+7spVdLxUzFOzOJa+BbzMd4AjRZq4TyiJTO+Cr
	xKilm3ww==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUyCr-00000000z5O-1bh8;
	Wed, 31 Jan 2024 00:11:57 +0000
Message-ID: <8fe881af-dab8-456f-8e8a-8d76153c4322@infradead.org>
Date: Tue, 30 Jan 2024 16:11:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30 3/7] Add Aspeed SOC 24xx, 25xx and 26xx JTAG support
Content-Language: en-US
To: "Corona, Ernesto" <ernesto.corona@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <LV8PR11MB846379E82775EFA1C9062D1C8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <LV8PR11MB846379E82775EFA1C9062D1C8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "Filary, Steven A" <steven.a.filary@intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'p.zabel@pengutronix.de'" <p.zabel@pengutronix.de>, "'pombredanne@nexb.com'" <pombredanne@nexb.com>, "Castro, Omar Eduardo" <omar.eduardo.castro@intel.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>, "Chen, Luke" <luke_chen@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 1/30/24 15:30, Corona, Ernesto wrote:
> +config USE_INTERRUPTS
> +	bool "Use interrupts as event wait mechanism"
> +	depends on JTAG_ASPEED
> +	default n
> +	help

This symbol needs some kind of namespacing. It is too generic as is.

Thanks.
-- 
#Randy
