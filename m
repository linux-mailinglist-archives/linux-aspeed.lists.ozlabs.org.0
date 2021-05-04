Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4537254D
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 May 2021 07:09:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ7DP3ft8z2yxL
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 May 2021 15:09:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fnIuE8Us;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=fnIuE8Us; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ7DC1n8zz2xZn
 for <linux-aspeed@lists.ozlabs.org>; Tue,  4 May 2021 15:08:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/l3ME+YyFSdYbM3W3a/AxJLnYEq4c0HL5DB1Few+tsY=; b=fnIuE8Usqiz+a4CZLKnOkXfjVJ
 L1km8jYZPUtgQgMylkarrD2aaff0nMK2iBLrcye228unywIpAk28B6ZRcp+n/0j5rIgXtKLrXrzhu
 9zFLC1afNQX2M+mCCRPoqQ/ujWWgiB85ACOVoji/gIzTvvtlQQEX1ashC0STdrMwE1s9OqskC6IBB
 GzQ97qD1RHNTxqpNq+7Vu38eN5uEP0zL0OLsdTsDZA8Sd3kM8XqO3oFBefCWmI0DYBWxYZnWPbSM5
 vEWAYh4teTS/J6fCCSuPTx9hCFbYqvOOSj/vAMjckWZvALOOUeEOXu/G+CxR/Bc0+ti3H6bi/Zej6
 D2EiXx0Q==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ldnHp-00G88E-81; Tue, 04 May 2021 05:08:00 +0000
Subject: Re: [PATCH] EDAC: aspeed: print resource_size_t using %pa
To: Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org
References: <20210503163409.31944-1-rdunlap@infradead.org>
 <e899781c-304c-4494-a544-e3950e928e55@www.fastmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <892dfd15-a8f7-9db9-86bb-9630e88e0e3c@infradead.org>
Date: Mon, 3 May 2021 22:07:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e899781c-304c-4494-a544-e3950e928e55@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Arnd Bergmann <arnd@kernel.org>, Tony Luck <tony.luck@intel.com>,
 kbuild test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>,
 Stefan M Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/3/21 9:57 PM, Andrew Jeffery wrote:
> 
> 
> On Tue, 4 May 2021, at 02:04, Randy Dunlap wrote:
>> Fix build warnings for using "%x" to print resource_size_t in 2 places.
>> resource_size_t can be either of u32 or u64. We have a special format
>> "%pa" for printing a resource_size_t, which is the same as a phys_addr_t.
>> See Documentation/core-api/printk-formats.rst.
>>
>>   CC      drivers/edac/aspeed_edac.o
>> ../drivers/edac/aspeed_edac.c: In function 'init_csrows':
>> ../drivers/edac/aspeed_edac.c:257:21: warning: format '%x' expects 
>> argument of type 'unsigned int', but argument 4 has type 
>> 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
>>   257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>>   257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>>   257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>> ../drivers/edac/aspeed_edac.c:257:21: warning: format '%x' expects 
>> argument of type 'unsigned int', but argument 5 has type 
>> 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
>>   257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>>   257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>>   257 |  dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>>
>> Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Troy Lee <troy_lee@aspeedtech.com>
>> Cc: Stefan Schaeckeler <sschaeck@cisco.com>
>> Cc: linux-edac@vger.kernel.org
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Borislav Petkov <bp@suse.de>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: linux-aspeed@lists.ozlabs.org
>> ---
>> Found in linux-next but applies to mainline.
> 
>>
>>  drivers/edac/aspeed_edac.c |    8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> --- linux-next-20210503.orig/drivers/edac/aspeed_edac.c
>> +++ linux-next-20210503/drivers/edac/aspeed_edac.c
>> @@ -234,6 +234,7 @@ static int init_csrows(struct mem_ctl_in
>>  	u32 nr_pages, dram_type;
>>  	struct dimm_info *dimm;
>>  	struct device_node *np;
>> +	resource_size_t rsize;
>>  	struct resource r;
>>  	u32 reg04;
>>  	int rc;
>> @@ -254,11 +255,12 @@ static int init_csrows(struct mem_ctl_in
>>  		return rc;
>>  	}
>>  
>> -	dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>> -		r.start, resource_size(&r), PAGE_SHIFT);
>> +	rsize = resource_size(&r);
>> +	dev_dbg(mci->pdev, "dt: /memory node resources: first page 
>> r.start=0x%pa, resource_size=0x%pa, PAGE_SHIFT macro=0x%x\n",
>> +		&r.start, &rsize, PAGE_SHIFT);
> 
> Arnd posted a fix a few days back that feels more intuitive, though 
> probably could have cleaned up the grammar:
> 
> https://lore.kernel.org/lkml/20210421135500.3518661-1-arnd@kernel.org/

Oh, that's fine. I just missed it. :(

thanks.
-- 
~Randy

