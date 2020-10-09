Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14B28818C
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 06:56:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6wkq08FtzDqX8
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 15:56:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=1BxGFoXj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=AB5WrPe4; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6wVf2lJnzDqW8
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 15:45:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D8CD5C0182;
 Fri,  9 Oct 2020 00:45:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 09 Oct 2020 00:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=BRuBsADEVVCeVh/onDvg51clB0N
 /sE9VmPmqTufMJxg=; b=1BxGFoXjpon9Hu8771S/vxunLpmIYDCt6/Y51BaaDSd
 2+4Ol5U0WOrHdvb/+0aH4BOLLMvGPZ3FQzsnjl6P+4F0nzJSQFL64wOg6nhanD+W
 J95muOrQrqmxJ4X9a+v05mlpHy7ByQri4duIqPbwQ6GedNPUo5KWfnpyD8BfHOHw
 7wFsytf0C6arf6UTbZ8KL0oktj40RClmniNvraLom+Qcc7TkdTT6TJhWondjdf0U
 JXUO5KeKYWD34RMpZnW1eQ6KXQDExxTbPDqbwktLAQ26ce952jCJLe4wckXwkIB6
 AMKz0pJBXzxL3F9yw+HVzrw74SklJj03g4WbO6otxsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BRuBsA
 DEVVCeVh/onDvg51clB0N/sE9VmPmqTufMJxg=; b=AB5WrPe4zlHkoM1cTHjsS/
 aRQnq/sVLME08cXUm4NyetmHGt6pA4kb5ZueHcsDqgZQXAyMcOCowXAuRYqdOZsl
 Mnt0TJQ0Ljj6VebuW8FKE3fmAKZgtdmws1bwMxoD4PuhQ/EIvXP+MAS9JXY9CbEb
 9qmUmxuxjCjkZGpTI3R0ixM6hXrOoeQBbpY4TCl2RsMVUnaExcos88GUzxM7LHpF
 AGqUo62ZwbDOyx9FcIO9Wn9Fpyzk0Gk0eTsq0Fg3n9qMJvZF+3nQVkpXl/JmtEFB
 KVN+fWccnid9ove61ZlQXfzHiHKRhiaVqfCBqBQFqBUzBrEPRnwswdkrdZIgQOeA
 ==
X-ME-Sender: <xms:5-p_X0Fh-Lmd-8SQbQrNKr5DQ7uwkAf9wNQBaJgKcVQ4I7h10rgP1Q>
 <xme:5-p_X9XqA6RnO8w83cxeMqZisZXEs8b_3088HHbN-SfpbBmEXEF_HqKXzHmcA3ttt
 KovBEhm8XQfqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedtgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
 keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:6Op_X-KyYoTBjdKLXP9Tf2tQe8IxwpxY2W0nPmW9T0PQMEhnFAWvaA>
 <xmx:6Op_X2Gi-DMZmlx42Yk1m_SRv7r_Xy9NrZA4JlIDEDhXxbw5sakV4g>
 <xmx:6Op_X6UNcI7lSDCvbnge6UECGoTX0BK13FAU-ju5CkU8n-IUaef8VA>
 <xmx:6Op_X8KYtEWzwbBb8sJdApQe-1QLikLOHQ26ne2Rqc9357cegVpORw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id B233F3064683;
 Fri,  9 Oct 2020 00:45:27 -0400 (EDT)
Date: Fri, 9 Oct 2020 06:45:26 +0200
From: Greg KH <greg@kroah.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 1/3] configs: aspeed: enable UHCI driver in defconfig
Message-ID: <20201009044526.GB111063@kroah.com>
References: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
 <20201009024937.11246-1-ryan_chen@aspeedtech.com>
 <20201009024937.11246-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009024937.11246-2-ryan_chen@aspeedtech.com>
X-Mailman-Approved-At: Fri, 09 Oct 2020 15:55:48 +1100
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
Cc: bmc-sw@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 09, 2020 at 10:49:35AM +0800, Ryan Chen wrote:
> v2:
>  -Changed : Add SCSI, BLK_DEV_SD, USB_STORAGE support.
> v1:
>  -Enable UHCI driver in aspeed_g5_defconfig.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Why do you need this in a defconfig?
