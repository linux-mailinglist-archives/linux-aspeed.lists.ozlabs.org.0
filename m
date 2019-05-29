Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 179472D9CE
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2019 12:00:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DR5y5VqszDqKy
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2019 20:00:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=xs4all.nl
 (client-ip=194.109.24.28; helo=lb2-smtp-cloud7.xs4all.net;
 envelope-from=hverkuil@xs4all.nl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xs4all.nl
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DR5r0nwJzDqBg
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 19:59:58 +1000 (AEST)
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae]
 ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
 by smtp-cloud7.xs4all.net with ESMTPA
 id VvIfh5RzU3qlsVvIghslMC; Wed, 29 May 2019 11:55:19 +0200
Subject: Re: [PATCH v2 00/11] Improve stability and add bug fixes of Aspeed
 video engine driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c841359a-96fe-eb74-e14c-29e304c6ba16@xs4all.nl>
Date: Wed, 29 May 2019 11:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPjUXrhJBvgXPPTEcsOCCcQshm3OE949Fo+PmiY2sJqd9MTPCcW7w/kbN4SONV4X4KXcJJglV8h/GN5HneFa6mBcsvu3y53EEeBXYrHYbT1eBEGkiDjF
 VKdE+PvDK344JZrQJbYA/Muy9gXbe1TepPLInRQ96MHSijq+SRwiCQ0XBXf3vWnGKPiOu4AL0xMNge3Rs+doGaKmESdhoBG1ET6VPSsMRjYPe83txEf+qWCJ
 DKC74tek992HCyelgeoJO4oo8ULpI0J0xMgLTn2jdokB2ZJSCQDcfAko9DgEVTXt36FtwyJ42VeafXofx99C0ZMCQZSkeihMW+n+xh90XgsrRiNC1yLpsm77
 ijEBlrvHa2pRGma9LnKxtN0KU98BY++vhvXA0EDHXcZ6C2oBjT+ZOQb0d33FmJf+O3prLZVDGwDDme3Jk2RybXviGbyWihNVIUGWOJFlF6Ehhao7RChc6qMU
 ByjxR2/nnl/baF6xBAOODTPuPRxRXEX/j9M/tQ==
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
Cc: linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Eddie,

Can you review the last 4 new patches? If all is OK, then I can make a pull
request for this series.

Regards,

	Hans

On 5/25/19 1:17 AM, Jae Hyun Yoo wrote:
> This patch series improves stability of Aspeed video engine driver by fixing
> clock control and irq handling logic in the driver. Also, it adds a couple of
> bug fixes and a workaroud for a silicon bug.
> 
> Changes since v1:
> - Removed spinlock handling code from 0001 patch.
> - Added 4 more patches.
> 
> Jae Hyun Yoo (11):
>   media: aspeed: fix a kernel warning on clk control
>   media: aspeed: refine clock control logic
>   media: aspeed: change irq to threaded irq
>   media: aspeed: remove IRQF_SHARED flag
>   media: aspeed: reduce noisy log printing outs
>   media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
>   media: aspeed: refine interrupt handling logic
>   media: aspeed: remove source buffer allocation before mode detection
>   media: aspeed: use different delays for triggering VE H/W reset
>   media: aspeed: fix an incorrect timeout checking in mode detection
>   media: aspeed: add a workaround to fix a silicon bug
> 
>  drivers/media/platform/aspeed-video.c | 140 +++++++++++++++-----------
>  1 file changed, 80 insertions(+), 60 deletions(-)
> 

