Return-Path: <linux-aspeed+bounces-3566-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL3/NzLYpGnWtwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-3566-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Mar 2026 01:22:10 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8BD1D211F
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Mar 2026 01:22:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPKPT03qgz2xqm;
	Mon, 02 Mar 2026 11:22:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772241701;
	cv=none; b=NsoRLNqrQ4kgMmSRhivaCs4HgUAALNs689S2ifxknmpCYuUS4OyX8vFlyG9htaV04rPmId+s/fI+khE+hiVkSHVaSrhSsRV4NEh8rd/zKyidnZh7arTceL54yjZ1cNnEnVKw7PP9Cs6n3NGkKSRa07riQxtd93Zw6k9xl8/N+drcMnV+l2JX/4+WSjO2LjGxVgXO9yvpgpaAJ2r2H1PMF9z+cYNrPUeAQVsN9eaCXNQsZt1CLCE1hYUuHw2/UZYtjdd2ZHI0epkHYADiNWSmXtqnMl3WifJ8+o5SQ2k6m0hM9mcoe2Sve8Cv5uOtKQUkRX7kV9kBsQjrKmQ3XmO9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772241701; c=relaxed/relaxed;
	bh=IVtwgUEgU7viJhk9iZiDp027XYkfTYNp3airlT7p+P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8FtcHoEV/NXAI3C9E6ubUKeZCeOv+uDm8R9C7cvR6OolVN9XvfxwQmOclCrcvoLI+MA4tIEpVg6nPtttzQqo6eywz64aTvcPJAUYzGDWbGsS7+KvYmuO5Ly+nVTCvAGJspCr4jyJlhdPIAR1MFmW9yaJm7vjDephnMJtddj+vF0qWQOt1GyNyWc2jpW806imxBk14nYyQvj1nchGDJ2DKMIcQr+V5whG1244IbMeiADDh6UMzsuXV9ac6Y61YscZ220ZvpE68y6td0xWlNZ2+QWFB2mQvaogDJO5PFmiWxEFJ70NCZiPoAxokNFUndlN98uikWVDVYDNzLTClmtEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c7NKEmmp; dkim-atps=neutral; spf=pass (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=haiyuewa@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c7NKEmmp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=haiyuewa@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN6q560HXz2xlj
	for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Feb 2026 12:21:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=IVtwgUEgU7viJhk9iZiDp027XYkfTYNp3airlT7p+P4=;
	b=c7NKEmmpmGseHyrobxDU25LdmCA0lhUitkXjxWgCPl3goVF2/0IpRQmv/HMlKa
	hZkf7MipfWkAzZu2FEGHyNW+if36YcSqUzRPzWrtYGe9LX1OS5uLVODrnL1lk5ay
	HE4fQGhqocnre53PwTfQ9mP8UMHWCRwtMfRRFQBO+Q7iY=
Received: from [192.168.11.65] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBn3935QqJp+sDLTQ--.20842S2;
	Sat, 28 Feb 2026 09:20:58 +0800 (CST)
Message-ID: <16a430a2-fdc9-41eb-945c-0727feb7b9d6@163.com>
Date: Sat, 28 Feb 2026 09:20:56 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ast2600: Add reset definition
 for video
To: Conor Dooley <conor@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260227151602.829-1-haiyuewa@163.com>
 <20260227-smooth-carefully-f427e242ce58@spud>
Content-Language: en-US
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <20260227-smooth-carefully-f427e242ce58@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSgvCgBn3935QqJp+sDLTQ--.20842S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxZFW3Gw4fZr4fGFy5XFb_yoW8WFyUpF
	sYyF1ktr4UZFWYk3yIq3WxtF1kWw15JF1Ygry5Wa4jya1rW3Wjg3yIgryY9a4DWr4fur12
	yFnFgFWDCFyIy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsjjgUUUUU=
X-Originating-IP: [116.233.47.41]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzRrRPWmiQvoI7gAA3u
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DATE_IN_PAST(1.00)[47];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[haiyuewa@163.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linux-aspeed@lists.ozlabs.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jammy_huang@aspeedtech.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3566-lists,linux-aspeed=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haiyuewa@163.com,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: AE8BD1D211F
X-Rspamd-Action: no action



On 2/28/2026 1:33 AM, Conor Dooley wrote:
> On Fri, Feb 27, 2026 at 11:13:14PM +0800, Haiyue Wang wrote:
>> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
>> header. It is required for proper reset control of the video on the
>> AST2600 SoC for aspeed-video driver.
>>
>> Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
> 
> How can a binding change be a fix for a driver one?
> 

https://git.kernel.org/torvalds/c/9897831de614

If squashed into one patch as v1 does, it will have patch format warning:
./scripts/checkpatch.pl ...patch
WARNING: DT binding docs and includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst

>> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
>> ---
>> v2:
>>    - Fix checkpatch.pl warning, and send dt-bindings as single patch as
>>      the submitting-patches guide.
>> v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
>> ---
>>   include/dt-bindings/clock/ast2600-clock.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
>> index f60fff261130..7b9b80c38a8b 100644
>> --- a/include/dt-bindings/clock/ast2600-clock.h
>> +++ b/include/dt-bindings/clock/ast2600-clock.h
>> @@ -124,6 +124,7 @@
>>   #define ASPEED_RESET_PCIE_RC_OEN	18
>>   #define ASPEED_RESET_MAC2		12
>>   #define ASPEED_RESET_MAC1		11
>> +#define ASPEED_RESET_VIDEO		6
>>   #define ASPEED_RESET_PCI_DP		5
>>   #define ASPEED_RESET_HACE		4
>>   #define ASPEED_RESET_AHB		1
>> -- 
>> 2.53.0
>>


